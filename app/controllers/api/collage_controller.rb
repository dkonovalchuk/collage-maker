module Api
  class CollageController < ApiController

    def show
      render json: { collage_url: collage_url }
    end

    private

    def collage_url
      "#{root_url}#{collage_service.collage_path}"
    end

    def collage_service
      @collage_service ||= CollageService.new(params, self)
    end
  end
end
