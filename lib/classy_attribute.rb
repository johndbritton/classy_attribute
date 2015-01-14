require 'classy_attribute/version'

module ClassyAttribute

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
