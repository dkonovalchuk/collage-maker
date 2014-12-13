class CollageService

  def initialize(image_urls)
    @image_urls = image_urls
  end

  def collage_path
    collage_creator.collage_path
  end

  private

  def collage_creator
    @collage_creator ||= CollageCreator.new(images)
  end

  def images
    images_downloader.images
  end

  def images_downloader
    @images_downloader ||= ImagesDownloader.new(@image_urls)
  end
end
