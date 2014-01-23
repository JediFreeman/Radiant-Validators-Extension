require 'active_record_validation_extender'

module UserValidationExtender
  def self.included(base)
    base.class_eval do
      base.clear_validations      

      validates_uniqueness_of :login, :name => :user_login_uniqueness

      validates_confirmation_of :password, :if => :confirm_password?, :name => :user_password_confirmation

      validates_presence_of :name, :login, :name => :user_name_login_presence
      validates_presence_of :password, :password_confirmation, :if => :new_record?, :name => :user_password_presence

      validates_format_of :email, :allow_nil => true, :with => /^$|^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :name => :user_email_format

      validates_length_of :name, :maximum => 100, :allow_nil => true, :name => :user_name_length
      validates_length_of :login, :within => 3..40, :allow_nil => true, :name => :user_login_length
      validates_length_of :password, :within => 5..40, :allow_nil => true, :if => :validate_length_of_password?, :name => :user_password_length
      validates_length_of :email, :maximum => 255, :allow_nil => true, :name => :user_email_length
    end    
  end
end