require 'active_record_validation_extender'

module PageFieldValidationExtender
  def self.included(base)
    base.class_eval do
      base.clear_validations
      validates_presence_of :name, :name => :page_field_name_presence
    end
  end
end