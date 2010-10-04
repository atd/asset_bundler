require 'asset_bundler'
require 'active_support'

class AssetBundler::JavascriptsController < ActionController::Base
  append_view_path Rails.root.join('app/assets/javascripts')
  
  def controller_path
    'javascripts'
  end
  
  def show
    headers['Cache-Control'] = 'public'
    headers['Expires']       = 1.year.from_now.httpdate
    
    render :template => params[:path]
  end
end
