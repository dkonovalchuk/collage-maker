class CollageService

  FOLDER_NAME = "collages"

  def initialize(params, renderer)
    @locals = params.slice(:menu_title, :items)
    @renderer = renderer

    save_collage
  end

  def collage_path
    File.join(FOLDER_NAME, filename)
  end

  private

  def save_collage
    img = IMGKit.new(html, width: 678, "disable-smart-width" => true)
    img.to_file(filepath)
  end

  def filepath
    File.join(Rails.root, "public", "collages", filename)
  end

  def filename
    @filename ||= "#{SecureRandom.hex}.jpg"
  end

  def html
    ActionController::Base.new.render_to_string("static_pages/preview", locals: @locals)
  end
end
