module Assets
  class StylesheetsController < AssetBundler::AssetsController
    respond_to :css
    
    private
    
    def expansions
      ActionView::Helpers::AssetTagHelper.stylesheet_expansions
    end
    
    def expansion?(path)
      expansions.keys.map(&:to_s).include?(path.to_s)
    end
  end
end
