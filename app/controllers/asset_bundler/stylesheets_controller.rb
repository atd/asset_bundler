class AssetBundler::StylesheetsController < AssetBundler::AssetsController
  self.view_paths = [
    Rails.root.join('app/assets'),
    AssetBundler::Engine.root.join('app/assets')
  ]
  
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
