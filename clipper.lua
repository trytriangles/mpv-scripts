-- clipper
-- 
-- Adds a hotkey to copy a segment of footage around the current time position
-- to a separate folder as its own file.
-- 
-- Requires ffmpeg on PATH.


-- TODO: Implement allow_duplicate_names.


-- Configuration
hotkey = "g"
log_path = "c:/home/documents/_red/clipper_log.log"
-- The log will contain lines in the form
--      <success: 0 | 1> <start_pos: int> <end_pos: int> <filename: str>
output_folder = "z:/temp/favclips/"
lead_in_secs = 6 -- Number of preceding seconds to include in the output clip.
clip_duration = 40
-- allow_duplicate_names = false -- If true, saving a clip with a filename that
                              -- already exists will add a numeric counter to
                              -- the filename, allowing it to be saved. If
                              -- false, attempting to save a clip with a name
                              -- that already exists is a no-op.
-- End configuration

function get_start_time()
    -- Get the start time for the clip, being the current time minus lead_in_secs,
    -- or 0 if that turns out to be negative.
    return math.max(mp.get_property_number("time-pos") - lead_in_secs, 0)
end

function record_in_logfile(filename, start_pos, end_pos, status)
    local logfile = io.open(log_path, "a")
    if logfile then
        local status_int = status and 1 or 0
        logfile:write(
            string.format("%d %d %d %s\n",
                status_int,
                start_pos,
                end_pos,
                filename
            )
        )
        logfile:close()
    end
end

function save_clip()
    mp.osd_message("saving clip")
    local filename = mp.get_property("path")
    local start_pos = get_start_time()
    local end_pos = start_pos + clip_duration
    local output_filename = output_folder .. string.format(
        "%s-%d_%d.mkv", mp.get_property("filename/no-ext"), start_pos, end_pos
    )
    
    if os.rename(output_filename, output_filename) ~= nil then
        mp.osd_message("clip already exists", 3)
        return
    end

    
    local cmd = string.format(
        "ffmpeg -loglevel quiet -ss %f -i \"%s\" -t %d -c copy \"%s\"",
        start_pos,
        filename,
        clip_duration,
        output_filename
    )

    local status = os.execute(cmd)
    if status == true then
        mp.osd_message("clip saved", 3)
    else
        mp.osd_message("ffmpeg call failed", 3)
    end

    record_in_logfile(filename, start_pos, end_pos, status)
end

mp.add_key_binding(hotkey, "save_clip", save_clip)
