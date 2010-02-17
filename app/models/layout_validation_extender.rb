require 'active_record_validation_extender'

module LayoutValidationExtender
  def self.included(base)
    base.class_eval {
      base.clear_validations      
      validates_presence_of :name, :message => 'required', :name => :layout_name_presence
      validates_uniqueness_of :name, :message => 'name already in use', :name => :layout_name_uniqueness
      validates_length_of :name, :maximum => 100, :message => '{{count}}-character limit', :name => :layout_name_length
    }
    
  end
end