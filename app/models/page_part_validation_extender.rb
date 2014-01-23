require 'active_record_validation_extender'

module PagePartValidationExtender
  def self.included(base)
    base.class_eval do
      base.clear_validations

      validates_presence_of :name, :name => :page_part_name_presence
      validates_length_of   :name, :maximum => 100, :name => :page_part_name_length
      validates_length_of   :filter_id, :maximum => 25, :allow_nil => true, :name => :page_part_filter_id_length
    end    
  end
end