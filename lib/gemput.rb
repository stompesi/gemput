require "gemput/version"
require 'gems'

module Gemput
  def self.add_gem(gem_name)
    return "Could not locate Gemfile." unless File.exists?('Gemfile')

    gem_info = Gems.info(gem_name)

    unless gem_info['name'].nil?
      open('Gemfile', 'a') { |f|
        f.puts "gem '#{gem_info['name']}', '~> #{gem_info['version']}'"
        p "'#{gem_info['name']}' gem added."
      }
    else
      p "This rubygem could not be found."
    end
  end

  def self.sync_gem()
    return "Could not locate Gemfile." unless File.exists?('./Gemfile')
    read_text = File.open('./Gemfile').read
    write_text = ''

    p 'gem version synchronizing start.'
    read_text.each_line do |line|
      gem_line = /^\s*gem '([^']*)'\s*$/.match(line)
      unless gem_line.nil?
        name = gem_line.captures[0]
        gem_info = Gems.info(name)
        gem_version = gem_info['version']
        write_text << line.delete!("\n") << ", '~> " << gem_version << "'\n"
        p "'#{name}' gem version added."
      else
        write_text << line
      end
    end

    aFile = File.new('./Gemfile', 'w')
    if aFile
        aFile.syswrite(write_text)
    else
        p 'Unable open file.'
    end

    p 'gem version synchronizing finished.'
  end

  def self.show_help()
    p 'This gem is gemversion management.'

    p '# you can add gem with gem version in Gemfile.'
    p '1-1 gemput add GEM_NAME'
    p '1-2 gemput a GEM_NAME'
    p '1-3 gemput -a GEM_NAME'
    p ''

    p '# you can fill gem version in Gemfile.'
    p '2-1 gemput sync'
    p '2-2 gemput s'
    p '2-3 gemput -s'

    p '# you can see help.'
    p '2-1 gemput help'
    p '2-2 gemput h'
    p '2-3 gemput -h'
  end
end
