# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class RadiantValidatorsExtension < Radiant::Extension
  version "1.0"
  description "Extension to allow overriding of built-in validators in Radiant"
  url "http://yourwebsite.com/radiant_validators"

  def activate
    Page.send :include, PageValidationExtender
    Layout.send :include, LayoutValidationExtender
    PagePart.send :include, PagePartValidationExtender
    Snippet.send :include, SnippetValidationExtender
    User.send :include, UserValidationExtender
  end
end
