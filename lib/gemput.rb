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

  def self.sync_gem()
    return "Could not locate Gemfile." unless File.exists?('Gemfile')
    read_text = File.open('Gemfile').read
    write_text = ''

    p 'version check.'
    read_text.each_line do |line|
      gem_line = /^\s*gem '([^']*)'\s*$/.match(line)
      unless gem_line.nil?
        name = gem_line.captures[0]
        gem_info = Gems.info(name)
        gem_version = gem_info['version']
        write_text << line.delete!("\n") << ", '~> " << gem_version << "'\n"
        p "Add gem version '#{name}'"
      else
        write_text << line
      end
    end

    aFile = File.new('./Gemfile', 'w')
    if aFile
        aFile.syswrite(write_text)
    else
        puts 'Unable open file'
    end

    p 'version check end.'
  end
end
