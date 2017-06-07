require "tiny_settings/version"

module TinySettings
  class Settings
    attr_accessor :file_path
    FILE_PATH = nil

    def initialize()
      @file_path ||= FILE_PATH
      self
    end

    def load_settings
      begin 
        file_path ||= FILE_PATH
        YAML.load_file('settings.yml')
      rescue
        {}
      end
    end

    def save_settings(settings = Yaml.new)
      file_path ||= FILE_PATH
      File.open('settings.yml', 'w') do |f|
        f.write settings.to_yaml
      end
    end
  end
end
