class AssetBundler::StylesheetsController < AssetBundler::AssetsController
  append_view_path Rails.root.join('app/assets/stylesheets')
  
  respond_to :css
  
  def controller_path
    'stylesheets'
  end
  
  protected
  
  def expansion?
    expansions = ActionView::Helpers::AssetTagHelper.stylesheet_expansions
    (expansions.keys.map(&:to_s) + ['all']).include? params[:path]
  end
end
