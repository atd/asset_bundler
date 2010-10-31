module Assets
  class ImagesController < AssetBundler::AssetsController
    respond_to :png, :jpeg, :gif

    private
    
    def expansion?(path)
      false
    end
  end
end
