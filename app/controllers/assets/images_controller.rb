module Assets
  class ImagesController < AssetBundler::AssetsController
    include ActionController::Streaming

    respond_to :png, :jpeg, :gif

    protected

    def go_render(path)
      send_file find_template(path).identifier,
                :type => formats.first,
                :disposition => 'inline'
    end
   
    private
    
    def expansion?(path)
      false
    end
  end
end
