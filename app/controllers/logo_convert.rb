require "rmagick"

source = Magick::Image.read("@play_critters").first
source = source.resize_to_fill(70, 70).quantize(256, Magick::GRAYColorspace).contrast(true)
overlay = Magick::Image.read("@play_critters").first
source.composite!(overlay, 0, 0, Magick::OverCompositeOp)
colored = Magick::Image.new(70, 70) { self.background_color = "red" }
colored.composite!(source.negate, 0, 0, Magick::CopyOpacityCompositeOp)
colored.write("@play_critters_altered")