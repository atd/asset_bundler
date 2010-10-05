class AssetBundler::JavascriptsController < AssetBundler::AssetsController
  append_view_path Rails.root.join('app/assets/javascripts')
  
  respond_to :js
  
  def controller_path
    'javascripts'
  end
  
  protected
  
  def expansion?
    expansions = ActionView::Helpers::AssetTagHelper.javascript_expansions
    (expansions.keys.map(&:to_s) + ['all']).include? params[:path]
  end
end
