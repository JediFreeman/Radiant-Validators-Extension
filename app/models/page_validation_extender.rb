require 'active_record_validation_extender'

module PageValidationExtender
  def self.included(base)
    base.class_eval {
      base.clear_validations      
      validates_presence_of :title, :slug, :breadcrumb, :status_id, :message => 'required', :name => :page_title_presence

      validates_length_of :title, :maximum => 255, :message => '{{count}}-character limit', :name => :page_title_length
      validates_length_of :slug, :maximum => 100, :message => '{{count}}-character limit', :name => :page_slug_length
      validates_length_of :breadcrumb, :maximum => 160, :message => '{{count}}-character limit', :name => :page_breadcrumb_length
      validates_format_of :slug, :with => %r{^([-_.A-Za-z0-9]*|/)$}, :message => 'invalid format', :name => :page_slug_format
      validates_uniqueness_of :slug, :scope => :parent_id, :message => 'slug already in use for child of parent', :name => :page_slug_uniqueness
      validates_numericality_of :id, :status_id, :parent_id, :allow_nil => true, :only_integer => true, :message => 'must be a number', :name => :page_numericality

      # no need to set name for this, just override the valid_class_name function to replace this behavior
      validate :valid_class_name 
    }
    
  end
end