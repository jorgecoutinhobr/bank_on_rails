module ApplicationHelper
  def badge_tag(account_type)
    css_class = account_type == "normal" ? "badge badge-accent" : "badge badge-warning"
    content_tag(:span, account_type.humanize, class: css_class)
  end
end
