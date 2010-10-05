class AssetBundler::JavascriptsController < AssetBundler::AssetsController
  self.view_paths = [
    Rails.root.join('app/assets/javascripts'),
    AssetBundler::Engine.root.join('app/assets/javascripts')
  ]
  
  respond_to :js
  
  def controller_path
    'assets/javascripts'
  end
  
  protected
  
  def expansion?
    expansions = ActionView::Helpers::AssetTagHelper.javascript_expansions
    (expansions.keys.map(&:to_s) + ['all']).include? params[:path]
  end
end
