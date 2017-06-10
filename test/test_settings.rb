$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_support'
require 'test/unit/active_support'
require 'tiny_settings'
require 'fileutils'


class TestSettings < ActiveSupport::TestCase
  include TinySettings
  def setup
    @test_hash = {"example"=> 1}
  end

  def test_init
    assert_nothing_raised do
      Settings.new() 
    end
  end

  def test_set_settings
    settings = Settings.new()
    settings.settings = @test_hash
    assert_equal(settings.settings["example"] , @test_hash["example"])
  end

  def test_save_settings
    settings = Settings.new()
    settings.settings = @test_hash
    assert_nothing_raised do
      settings.save_settings
    end
    FileUtils.rm(settings.file_path)
  end

  def test_load_settings
    settings = Settings.new()
    settings.settings = @test_hash
    assert_nothing_raised do
      settings.save_settings
    end
    settings = Settings.new()
    assert_nothing_raised do
      settings.load_settings
      assert_equal(settings.settings["example"], @test_hash["example"])
    end
    FileUtils.rm(settings.file_path)
  end
end
