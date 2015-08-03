require "rmagick"

source = Magick::Image.read("").first
source = source.resize_to_fill(70, 70).quantize(256, Magick::GRAYColorspace).contrast(true)
overlay = Magick::Image.read("stamp_overlay.png").first
source.composite!(overlay, 0, 0, Magick::OverCompositeOp)
colored = Magick::Image.new(70, 70) { self.background_color = "red" }
colored.composite!(source.negate, 0, 0, Magick::CopyOpacityCompositeOp)
colored.write("stamp.png")