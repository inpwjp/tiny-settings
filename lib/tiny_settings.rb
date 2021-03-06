require "tiny_settings/version"
require "methodize/hash"
require "yaml"

module TinySettings
  class Settings
    attr_accessor :file_path,:settings
    FILE_PATH = Dir.pwd

    def initialize()
      @file_path ||= [FILE_PATH ,"/", "settings.yml"].join
      @settings = {}
      self
    end

    def load
      begin 
        @settings = YAML.load_file(@file_path)
      rescue
        {}
      end
    end

    def save
      File.open(@file_path, 'w') do |f|
        f.write @settings.to_yaml
      end
    end

    def symbolize_keys
      self.settings.map{|k,v| [k.to_sym, v] }.to_h
    end

    def methodize!
      self.settings.methodize! 
    end

    def symbolize_keys!
      tmp_hash = symbolize_keys
      self.settings = tmp_hash
    end
  end
end
