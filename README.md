Radiant Validators
==================

This [Radiant CMS][1] extension allows extension developers to easily override the validators 
built into Radiant's models. This is done by adding a new method to the ActiveRecord class to 
clear validations, and methods to remove validations based on validator name. All built-in 
Radiant model validations are cleared and redefined in this extension with names set to allow 
other extensions to remove them easily.

INSTALLATION
============

1: Install the extension files

    Automated Installation:
    ./script/extension install radiant_validators

    Manual Installation:
    cd ./vendor/extensions
    git clone git://github.com/JediFreeman/Radiant-Validators-Extension.git

2: Once installed, you need to ensure the application will load this extension first. If it does not, 
it is possible that another extension will create some custom validators on radiant core models and 
they will get removed when this extension loads and resets the validators. To do so, edit your 
config/environment.rb to load Help first:

Radiant::Initializer.run do |config|
...
  config.extensions = [:radiant_validators, :all]
...
end

3: Restart the server

HOW TO USE
==========

To override a validator, it is pretty straight forward. Take a look at the example below that 
overrides the Page model slug format validator to allow apostrophes.

1: In your extension lib directory, create an extender file for the model you wish to override 
(for example, we are overridding the Page model, so we create page_extender.rb) and add the following:

    module PageExtender
      def self.included(base)
        base.class_eval {
          # remove the existing validation for slug format
          base.remove_validation :page_slug_format

          # add a new validator with a slightly different regex to allow apostrophes
          validates_format_of :slug, :with => %r{^([-_.A-Za-z0-9']*|/)$}, :message => 'invalid format', :name => :page_slug_format
        }
      end
    end

2: In your main extension file activate method, include your extender on the Page model:

    def activate
      Page.send :include, PageExtender
    end

3: Restart the server

ADDITIONAL INFORMATION
======================

To see a list of validator names, take a look in radiant_validators/app/models/*_validation_extender.rb files.

custom validator functions (defined with 'validate :function_name') are not in the scope of this extension, 
as those can already easily be overridden by creating a new function in your extender.

You can verify the validators on a model by loading up the script/console and calling <Model>.validate 
(ie, Page.validate). You will get a list of validators and you should be able to see the :name setting for each one.

QUESTIONS OR ISSUES
===================

Please use the Issues panel on the [GitHub Project Page][2] to report any issues.

[1]: http://radiantcms.org/
[2]: http://github.com/JediFreeman/Radiant-Validators-Extension
