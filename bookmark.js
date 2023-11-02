function bookmark() {
  var time_pos = Math.floor(mp.get_property_number("time-pos"));
  var path = mp.get_property("path");
  var valueBytes = path.length;
  var formattedPath = "%" + valueBytes + "%" + path;
  var s = formattedPath + "," + time_pos + "," + 40 + ",oshash=null" + "\n";
  mp.utils.append_file("file://~/vids.edl", s);
  mp.osd_message("Bookmarked!");
}

mp.add_key_binding("b", "bookmark", bookmark);
