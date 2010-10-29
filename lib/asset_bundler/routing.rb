require 'action_dispatch/routing/mapper'

module ActionDispatch::Routing::Mapper::Assets
  # TODO: provide { route => location } mappings; can't right now because
  # adding a +location+ to the controller's +view_paths+ adds it for _all_
  # +path+s.
  
  #
  # Renders Javascript assets whenever +paths+ are matched. Defaults to
  # recognizing routes under '/javascripts' if no +paths+ are given.
  #
  def javascripts(*paths)
    paths.push '/javascripts' if paths.empty?
    paths.each do |route|
      match "#{route}/*path.:format", :to => 'assets/javascripts#go'
    end
  end
  
  #
  # Renders stylesheet assets whenever +paths+ are matched. Defaults to
  # recognizing routes under '/stylesheets' if no +paths+ are given.
  #
  def stylesheets(*paths)
    paths.push '/stylesheets' if paths.empty?
    paths.each do |route|
      match "#{route}/*path.:format", :to => 'assets/stylesheets#go'
    end
  end

  #
  # Renders image assets whenever +paths+ are matched. Defaults to
  # recognizing routes under '/images' if no +paths+ are given.
  #
  def images(*paths)
    paths.push '/images' if paths.empty?
    paths.each do |route|
      match "#{route}/*path.:format", :to => 'assets/images#go'
    end
  end
end

class ActionDispatch::Routing::Mapper
  include ActionDispatch::Routing::Mapper::Assets
end
