module Assets
  class JavascriptsController < AssetBundler::AssetsController
    respond_to :js
    
    private
    
    def expansions
      ActionView::Helpers::AssetTagHelper.javascript_expansions
    end
    
    def expansion?(path)
      expansions.keys.map(&:to_s).include?(path.to_s)
    end
  end
end
