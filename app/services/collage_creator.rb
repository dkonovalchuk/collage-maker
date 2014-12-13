class CollageCreator

  FOLDER_NAME = "collages"
  COLLAGE_PATH = File.join(Rails.root, "public", FOLDER_NAME)

  def initialize(images)
    @images = images

    create_collage
  end

  def collage_path
    File.join(FOLDER_NAME, filename)
  end

  private

  def create_collage
    collage = Magick::ImageList.new

    @images.in_groups_of(2, false) do |group|
      proccess_collage_row(collage, group)
    end

    collage.append(true).write(filepath)
  end

  def proccess_collage_row(collage, row_images)
    row = Magick::ImageList.new
    row_images.each { |image| row << (image) }
    collage << (row.append(false))
  end

  def filepath
    "#{COLLAGE_PATH}/#{filename}"
  end

  def filename
    @filename ||= "collage-#{SecureRandom.hex}.jpg"
  end
end
