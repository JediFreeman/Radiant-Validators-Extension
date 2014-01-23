require 'active_record_validation_extender'

module PageValidationExtender
  def self.included(base)
    base.class_eval do
      base.clear_validations      

      validates_presence_of :title, :slug, :breadcrumb, :status_id, :name => :page_title_presence

      validates_length_of :title, :maximum => 255, :name => :page_title_length
      validates_length_of :slug, :maximum => 100, :name => :page_slug_length
      validates_length_of :breadcrumb, :maximum => 160, :name => :page_breadcrumb_length

      validates_format_of :slug, :with => %r{^([-_.A-Za-z0-9]*|/)$}, :name => :page_slug_format
      validates_uniqueness_of :slug, :scope => :parent_id, :name => :page_slug_uniqueness

      # no need to set name for this, just override the valid_class_name function to replace this behavior
      validate :valid_class_name
    end
  end
end