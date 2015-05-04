require "gemput/version"
require 'gems'

module Gemput
  def self.add_gem(gem_name)
    unless File.exists?('Gemfile')
      puts ''
      puts "# Could not locate Gemfile."
      puts ''
      return
    end
    if gem_name.nil?
      puts ''
      puts "# Need gem name."
      puts ''
      puts '- Usage: '
      puts '  1-1 gemput add GEM_NAME'
      puts '  1-2 gemput a GEM_NAME'
      puts '  1-3 gemput -a GEM_NAME'
      puts ''
      return
    end 

    gem_info = Gems.info(gem_name)

    unless gem_info['name'].nil?

      cursor_new_line = !!(/\n$/ =~ File.open('Gemfile').to_a.last)
      open('Gemfile', 'a') { |f|
        unless cursor_new_line
          f.puts "\n"
        end  
        f.puts "gem '#{gem_info['name']}', '~> #{gem_info['version']}'"
        puts ''
        puts "  '#{gem_info['name']}' gem added."
        puts ''
      }
    else
      puts ''
      puts "# This rubygem could not be found."
      puts ''
    end
  end

  def self.sync_gem()
    unless File.exists?('Gemfile')
      puts ''
      puts "# Could not locate Gemfile."
      puts ''
      return
    end
    read_text = File.open('./Gemfile').read
    write_text = ''
    puts ''
    puts '# gem version synchronizing start.'
    read_text.each_line do |line|
      gem_line = /^\s*gem ['"]([^']*)['"]\s*$/.match(line)
      unless gem_line.nil?
        name = gem_line.captures[0]
        gem_info = Gems.info(name)
        gem_version = gem_info['version']
        write_text << line.sub(/\s+\Z/, "") << ", '~> " << gem_version << "'\n"
        puts "  - '#{name}' gem version added."
      else
        write_text << line
      end
    end

    aFile = File.new('./Gemfile', 'w')
    if aFile
        aFile.syswrite(write_text)
    else
        puts ''
        puts '# Unable open file.'
        puts ''
        return
    end
    puts '# gem version synchronizing finished.'
    puts ''
  end

  def self.show_help()
    puts ''
    puts 'This gem manages the version of gems in the Gemfile.'
    puts ''

    puts '# you can add a gem along with its latest gem version in the Gemfile.'
    puts '  1-1 gemput add GEM_NAME'
    puts '  1-2 gemput a GEM_NAME'
    puts '  1-3 gemput -a GEM_NAME'
    puts ''

    puts '# you can fill out the missing gem versions in the Gemfile.'
    puts '  2-1 gemput sync'
    puts '  2-2 gemput s'
    puts '  2-3 gemput -s'
    puts ''

    puts '# you can view command helps.'
    puts '  3-1 gemput help'
    puts '  3-2 gemput h'
    puts '  3-3 gemput -h'
    puts ''
  end
end
