# Collider

# Code status

[![Build Status](https://travis-ci.org/forsaken1/collider.cr.svg?branch=master)](https://github.com/forsaken1/collider.cr)

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  collider:
    github: forsaken1/collider.cr
```


## Usage

```crystal
require "collider"

...

# check rectangles collisions (for two rectangles)
# three parameters:
#   angle of reference system from base reference system of first rectangle (radians, Float64), 
#   angle of reference system from base reference system of second rectangle (radians, Float64), 
#   rectangle coordinates in format: [x1, y1, x2, y2, ..., x8, y8] : Array(Float64)
Collider.separating_axis_theorem_for_rectangles 0.to_rad, 50.to_rad,
  Collider.rectangle_points(fx, fy, fw) +
  Collider.rectangle_points_rotate(50.to_rad, Collider.rectangle_points(ox, oy, ow))

```


## Contributing

1. Fork it ( https://github.com/forsaken1/collider.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [forsaken1](https://github.com/forsaken1) forsaken1 - creator, maintainer
