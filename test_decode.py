from math import isclose


def decode(high, low, minimum, maximum):
    return minimum + (maximum - minimum) * (high * 256 + low) / 65535


assert decode(0, 0, -10, 10) == -10
assert decode(255, 255, -10, 10) == 10
assert isclose(decode(1, 0, 0, 65535) - decode(0, 255, 0, 65535), 1)
assert isclose((decode(0, 255, 0, 65535) + decode(1, 0, 0, 65535)) / 2, 255.5)
print('Packing and interpolation checks passed')
