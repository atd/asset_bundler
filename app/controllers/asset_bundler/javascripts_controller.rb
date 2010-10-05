require 'asset_bundler'
require 'active_support'

class AssetBundler::JavascriptsController < ActionController::Base
  append_view_path Rails.root.join('app/assets/javascripts')
  
  respond_to :js
  
  before_filter :protect_against_dos!, :only => :index
  before_filter :cache!
  
  def controller_path
    'javascripts'
  end
  
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
    unless expansion?
      raise AbstractController::ActionNotFound,
        "The action '#{params[:path]}' could not be found for #{self.class.name}"
    end
  end
  
  def expansion?
    expansions = ActionView::Helpers::AssetTagHelper.javascript_expansions
    (expansions.keys.map(&:to_s) + ['all']).include? params[:path]
  end
end
