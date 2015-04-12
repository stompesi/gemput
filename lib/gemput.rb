require "gemput/version"
require 'gems'

module Gemput
  def self.add_gem(gem_name)
    return "Could not locate Gemfile." unless File.exists?('Gemfile')

    gem_info = Gems.info(gem_name)

    unless gem_info['name'].nil?
      open('Gemfile', 'a') { |f|
        f.puts "gem '#{gem_info['name']}', '~> #{gem_info['version']}'"
        "Add gem '#{gem_info['name']}', '~> #{gem_info['version']}'"
      }  
    else 
      "This rubygem could not be found."
    end
    
  end
end


