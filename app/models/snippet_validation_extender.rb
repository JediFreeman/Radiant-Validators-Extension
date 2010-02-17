require 'active_record_validation_extender'

module SnippetValidationExtender
  def self.included(base)
    base.class_eval {
      base.clear_validations      
      validates_presence_of :name, :message => 'required', :name => :snippet_name_presence
      validates_length_of :name, :maximum => 100, :message => '{{count}}-character limit', :name => :snippet_name_length
      validates_length_of :filter_id, :maximum => 25, :allow_nil => true, :message => '{{count}}-character limit', :name => :snippet_filter_id_length
      validates_format_of :name, :with => %r{^\S*$}, :message => 'cannot contain spaces or tabs', :name => :snippet_name_format
      validates_uniqueness_of :name, :message => 'name already in use', :name => :snippet_name_uniqueness
    }
    
  end
end