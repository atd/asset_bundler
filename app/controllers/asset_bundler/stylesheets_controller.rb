class AssetBundler::StylesheetsController < AssetBundler::AssetsController
  respond_to :css
  
  def controller_path
    'assets/stylesheets'
  end
  
  protected
  
  def expansion?
    expansions = ActionView::Helpers::AssetTagHelper.stylesheet_expansions
    (expansions.keys.map(&:to_s) + ['all']).include? params[:path]
  end
end
