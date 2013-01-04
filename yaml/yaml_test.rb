#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require 'yaml'

config = YAML.load_file("app_config.yaml")

puts "config: #{config}"
puts "config[character_images]: #{config["character_images"]}"
