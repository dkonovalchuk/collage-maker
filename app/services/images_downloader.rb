require "open-uri"

class ImagesDownloader

  def initialize(image_urls)
    @image_urls = image_urls
  end

  def images
    @image_urls.map { |url| remote_image(url) }
  end

  private

  def remote_image(url)
    remote = open(url)
    Magick::Image.from_blob(remote.read).first
  end
end
