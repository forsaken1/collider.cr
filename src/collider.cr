require "./collider/*"

module Collider
  def self.separating_axis_theorem_for_rectangles(angle1, angle2, rectangles_points)
    rectangles_with_angle_colliding?(angle1, rectangles_points) &&
      rectangles_with_angle_colliding?(angle2, rectangles_points)
  end

  # enter:  center point coords and half width and half height of rectangle
  # return: [x1, y1, x2, y2, x3, y3, x4, y4]
  def self.rectangle_points(center_x, center_y, half_width, half_height = half_width)
    [
      center_x + half_width, center_y + half_height,
      center_x - half_width, center_y + half_height,
      center_x + half_width, center_y - half_height,
      center_x - half_width, center_y - half_height,
    ]
  end

  # enter:  points = [x1, y1, x2, y2, x3, y3, x4, y4]
  # return: points after rotating
  def self.rectangle_points_rotate(angle_rad, points)
    points.in_groups_of(2, 0.0).map { |p| rotate_point(p[0], p[1], angle_rad, p[0], p[1]) }.flatten
  end

  def self.rectangles_with_angle_colliding?(angle_rad, points)
    rectangles_colliding? rectangle_points_rotate_around_zero(angle_rad, points)
  end

  def self.rectangle_points_rotate_around_zero(angle_rad, points)
    points.in_groups_of(2, 0.0).map { |p| rotate_point(p[0], p[1], angle_rad) }.flatten
  end

  def self.rectangles_colliding?(points)
    segments_colliding?(*min_max(rectangle_only_x(points))) &&
      segments_colliding?(*min_max(rectangle_only_y(points)))
  end

  def self.rectangle_only_x(points)
    points.map_with_index { |x, i| x if i % 2 == 0 }.compact
  end

  def self.rectangle_only_y(points)
    points.map_with_index { |x, i| x if i % 2 == 1 }.compact
  end

  def self.min_max(args)
    args[0..3].minmax + args[4..7].minmax
  end

  # Check segments colliding
  def self.segments_colliding?(min1, max1, min2, max2)
    min1 <= min2 && min2 <= max1 || min2 <= min1 && min1 <= max2
  end

  # Rotate point (x, y) around point (x0, y0)
  def self.rotate_point(x, y, angle, x0 = 0.0, y0 = 0.0)
    [
      rotate_x(x, y, angle, x0, y0),
      rotate_y(x, y, angle, x0, y0),
    ]
  end

  # Rotate x coordinate around point (x0, y0)
  def self.rotate_x(x, y, angle, x0 = 0.0, y0 = 0.0)
    (x0 + (x - x0) * Math.cos(angle) - (y - y0) * Math.sin(angle)).round(5)
  end

  # Rotate y coordinate around point (x0, y0)
  def self.rotate_y(x, y, angle, x0 = 0.0, y0 = 0.0)
    (y0 + (x - x0) * Math.sin(angle) + (y - y0) * Math.cos(angle)).round(5)
  end

  # Get distance between (x1, y1) and (x2, y2)
  def self.distance(x1, y1, x2, y2)
    Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)
  end
end
