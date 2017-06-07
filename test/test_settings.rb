$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_support'
require 'test/unit/active_support'
require 'tiny_settings'


class TestSettings < ActiveSupport::TestCase
  include TinySettings
  def test_init
    assert_nothing_raised do
      Settings.new() 
    end
  end
end
