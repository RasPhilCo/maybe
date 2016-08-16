require "maybe/version"

module Maybe
  class NullObject
    def method_missing(*args, &block)
      self
    end

    def nil?; true; end

    # conversions
    def to_a; []; end
    def to_s; ""; end
    def to_f; 0.0; end
    def to_i; 0; end

    # rails helpers
    def present?; false; end
    def empty?; true; end

    # misc
    def tap; self; end
  end
end

def Maybe(value)
  case value
  when nil then Maybe::NullObject.new
  else value
  end
end
