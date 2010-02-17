module ActiveRecord
  class Base
    def self.clear_validations
      @validate_callbacks = []
    end  
    def self.remove_validation(sym)
     @validate_callbacks.reject! {|validation| validation.options[:name] == sym}
    end
    def self.remove_validation_group(sym)
     @validate_callbacks.reject! {|validation| validation.options[:group] == sym}
    end
  end
end 