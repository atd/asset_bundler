require 'asset_bundler'
require 'active_support'

class AssetBundler::AssetsController < ActionController::Base
  before_filter :protect_against_dos!, :only => :index
  before_filter :cache!
  
  def index
    @expansion = params[:path].to_sym
  end
  
  def show
    render :template => params[:path]
  end
  
  protected
  
  def cache!
    headers['Cache-Control'] = 'public'
    headers['Expires']       = 1.year.from_now.httpdate
  end
  
  def protect_against_dos!
    unless expansion? # implemented by descendants
      raise AbstractController::ActionNotFound,
        "The action '#{params[:path]}' could not be found for #{self.class.name}"
    end
  end
end
