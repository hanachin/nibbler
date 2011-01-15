require 'nibbler'

# a wrapper for JSON data that provides `at` and `search`
class Nibbler::JsonDocument
  attr_reader :data
  
  def initialize(obj)
    @data = String === obj ? JSON.parse(obj) : obj
  end
  
  def self.[](obj)
    self.class === obj ? obj : new(obj)
  end
  
  def search(selector)
    Array === data ? data : Array(at(selector))
  end
  
  def at(selector)
    data[selector]
  end
end

# a scraper that works with JsonDocument
class NibblerJSON < Nibbler
  def self.convert_document(doc)
    Nibbler::JsonDocument[doc]
  end
end
