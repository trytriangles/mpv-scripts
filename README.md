# mpv scripts

A set of hopefully handy scripts for the beloved [mpv](https://github.com/mpv-player/mpv) media player.

## Scripts

### bookmark

Adds a hotkey (by default, **b**) to write the current file and time position in
edit-decision-list line format to a specified file (by default,
`$HOME/vids.edl`).

### clipper

Adds a hotkey to save a segment of footage around the current time position to
a specified folder.

Configure the lead-in time, clip duration, log path, and output path in
`clipper.lua`.

Defaults:

| Property    | Default                 |
| ----------- | ----------------------- |
| Hotkey      | g                       |
| Lead-in     | 6 seconds               |
| Duration    | 40 seconds              |
| Output path | `$HOME/mpv clips/`      |
| Log path    | `$HOME/mpv-clipper.log` |

Requires [ffmpeg](https://github.com/FFmpeg/FFmpeg) to be available.

## License

MIT License

Copyright (c) 2023 Ryan Plant ([ryan@ryanplant.net](mailto:ryan@ryanplant.net))

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
