require 'active_record_validation_extender'

module PagePartValidationExtender
  def self.included(base)
    base.class_eval {
      base.clear_validations      
      validates_presence_of :name, :message => 'required', :name => :page_part_name_presence
      validates_length_of :name, :maximum => 100, :message => '{{count}}-character limit', :name => :page_part_name_length
      validates_length_of :filter_id, :maximum => 25, :allow_nil => true, :message => '{{count}}-character limit', :name => :page_part_filter_id_length
      validates_numericality_of :id, :page_id, :allow_nil => true, :only_integer => true, :message => 'must be a number', :name => :page_part_id_numericality
    }
    
  end
end