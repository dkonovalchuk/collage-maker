class StaticPagesController < ApplicationController

  def index
    img = IMGKit.new(collage_url)
    File.open("public/collages/collage.jpg", "wb") { |f| f.write(img.to_img) }
  end

  def preview
    render layout: false
  end
end
