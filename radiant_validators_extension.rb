class RadiantValidatorsExtension < Radiant::Extension
  version "#{File.read(File.expand_path(File.dirname(__FILE__)) + '/VERSION')}"
  description "Extension to allow overriding of built-in validators in Radiant"
  url "http://github.com/JediFreeman/Radiant-Validators-Extension"

  def activate
    Page.send :include, PageValidationExtender
    Layout.send :include, LayoutValidationExtender
    PagePart.send :include, PagePartValidationExtender
    Snippet.send :include, SnippetValidationExtender
    User.send :include, UserValidationExtender
  end
end
