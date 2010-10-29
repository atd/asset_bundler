require 'rubygems'
require 'bundler'

class Bundler::GemHelper
  def install_gem
    built_gem_path = build_gem
    out, err, code = sh_with_code("sudo gem install #{built_gem_path} --no-rdoc --no-ri")
    if err[/ERROR/]
      Bundler.ui.error err
    else
      Bundler.ui.confirm "#{name} (#{version}) installed"
    end
  end
end

Bundler::GemHelper.install_tasks
