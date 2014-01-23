# Uncomment this if you reference any of your controllers in activate
# require_dependency "application_controller"
require "radiant-radiant_validators-extension"

class RadiantValidatorsExtension < Radiant::Extension
  version     RadiantRadiantValidatorsExtension::VERSION
  description RadiantRadiantValidatorsExtension::DESCRIPTION
  url         RadiantRadiantValidatorsExtension::URL

  # See your config/routes.rb file in this extension to define custom routes

  extension_config do |config|
    # config is the Radiant.configuration object
  end

  def activate
    Page.send       :include, PageValidationExtender
    PageField.send  :include, PageFieldValidationExtender
    Layout.send     :include, LayoutValidationExtender
    PagePart.send   :include, PagePartValidationExtender
    Snippet.send    :include, SnippetValidationExtender
    User.send       :include, UserValidationExtender
  end
end