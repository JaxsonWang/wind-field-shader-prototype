# Wind field shader prototype

A small WebGL 2 GLSL prototype for decoding packed wind vectors and manually interpolating them. This is a new prototype, not an existing production implementation.

Each RGBA8 texel stores the high and low bytes of U in RG and V in BA. The two components are mapped to their respective ranges using uniform minimum and maximum vectors. The caller supplies valid coordinates and handles missing data and boundaries. Decode each texel before interpolating; hardware filtering of packed bytes is incorrect at byte carries.

Run the packing and interpolation checks with `python3 test_decode.py`. The shader has not been tested on a GPU.
