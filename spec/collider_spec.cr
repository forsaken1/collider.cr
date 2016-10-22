require "./spec_helper"
require "./support/monkey_patch"

describe Collider do
  describe "#rotate_point" do
    it "return rotated coords" do
      Collider.rotate_point(1.45, 0.55, 315.to_rad, 1, 1).should eq [1.0, 0.3636]
    end

    it "return rotated coords" do
      Collider.rotate_point(1.45, 0.55, 270.to_rad, 1, 1).should eq [0.55, 0.55]
    end

    it "return rotated coords" do
      Collider.rotate_point(1.45, 0.55, 225.to_rad, 1, 1).should eq [0.3636, 1.0]
    end

    it "return rotated coords" do
      Collider.rotate_point(1.45, 0.55, 180.to_rad, 1, 1).should eq [0.55, 1.45]
    end

    it "return rotated coords around center" do
      Collider.rotate_point(1, 1, 45.to_rad).should eq [0, 1.41421]
    end

    it "return rotated coords around center" do
      Collider.rotate_point(1, 1, 90.to_rad).should eq [-1, 1]
    end

    it "return rotated coords around center" do
      Collider.rotate_point(1, 1, 135.to_rad).should eq [-1.41421, 0]
    end

    it "return rotated coords around center" do
      Collider.rotate_point(1, 1, 180.to_rad).should eq [-1, -1]
    end
  end

  describe "#segments_colliding?" do
    it "return true if axis colliding" do
      Collider.segments_colliding?(1, 3, 2, 4).should eq true
    end

    it "return true if axis colliding" do
      Collider.segments_colliding?(1, 4, 2, 3).should eq true
    end

    it "return true if axis colliding" do
      Collider.segments_colliding?(2, 3, 1, 4).should eq true
    end

    it "return true if axis colliding" do
      Collider.segments_colliding?(1, 3, 3, 4).should eq true
    end

    it "return true if axis colliding" do
      Collider.segments_colliding?(3, 5, 3.5, 4.5).should eq true
    end

    it "return false if axis not colliding" do
      Collider.segments_colliding?(1, 2, 3, 4).should eq false
    end

    it "return false if axis not colliding" do
      Collider.segments_colliding?(1, 3, 3.0001, 4).should eq false
    end
  end

  describe "#min_max" do
    it "return minimal and maximal coords" do
      Collider.min_max([1, 4, 2, 3, 6, 5, 8, 7]).should eq({1, 4, 5, 8})
    end
  end

  describe "#rectange_only_x" do
    it "return 8 'X' coords from 16 point coords" do
      Collider.rectangle_only_x([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]).should eq [1, 3, 5, 7, 9, 11, 13, 15]
    end
  end

  describe "#rectangle_only_y" do
    it "return 8 'Y' coords from 16 point coords" do
      Collider.rectangle_only_y([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]).should eq [2, 4, 6, 8, 10, 12, 14, 16]
    end
  end

  describe "#rectangles_colliding?" do
    it "return true if rectangles colliding" do
      Collider.rectangles_colliding?([1, 1, 1, 2, 2, 1, 2, 2, 1.5, 1.5, 1.5, 3, 3, 1.5, 3, 3]).should eq true
    end

    it "return false if rectangles not colliding" do
      Collider.rectangles_colliding?([1, 1, 1, 2, 2, 1, 2, 2, 3, 3, 3, 4, 4, 3, 4, 4]).should eq false
    end
  end

  describe "#rectangle_points" do
    it "return rectangle points by center coords and half width" do
      Collider.rectangle_points(1, 1, 1).should eq [2, 2, 0, 2, 2, 0, 0, 0]
    end
  end
end
