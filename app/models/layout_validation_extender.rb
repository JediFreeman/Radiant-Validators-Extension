require 'active_record_validation_extender'

module LayoutValidationExtender
  def self.included(base)
    base.class_eval do
      base.clear_validations      
      validates_presence_of   :name, :name => :layout_name_presence
      validates_uniqueness_of :name, :name => :layout_name_uniqueness
      validates_length_of     :name, :maximum => 100, :name => :layout_name_length
    end    
  end
end