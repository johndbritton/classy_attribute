require 'classy_attribute/version'

module ClassyAttribute

  include Comparable

  def <=>(other)
    return if other.class != self.class

    if value < other.value
      -1
    elsif value == other.value
      0
    else value > other.value
      1
    end
  end

  attr_accessor :value

  def initialize(value)
    self.value = value
  end

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def dump(object)
      return unless object.is_a?(self)
      object.value
    end

    def load(value)
      return if value.nil?

      self.new(value)
    end
  end
end
