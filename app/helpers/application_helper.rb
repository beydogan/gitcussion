module ApplicationHelper
  include RailsBootstrapHelpers::Helpers::OptionsHelper

  def fa_icon (icon, options = {})
    options = options.dup

    icon = ERB::Util.html_escape(icon.to_s)
    append_class!(options, "fa-" + icon)

    if options.delete(:invert)
      append_class!(options, "icon-white")
    end

    cls = options[:class]

    "<i class=\"fa #{cls}\"></i>".html_safe
  end
end
