module ApplicationHelper
  include Pagy::Frontend

  def badge_tag(account_type)
    css_class = account_type == "normal" ? "badge badge-accent" : "badge badge-warning"
    content_tag(:span, account_type.humanize, class: css_class)
  end

  def money_tag(amount, type = nil, receiver = false)
    return content_tag(:span, "#{number_to_currency(amount)}", class: "text-green-500") if type == "deposit" || receiver
    content_tag(:span, "(#{number_to_currency(amount)})", class: "text-red-500")
  end

  def formatted_date(date)
    date.strftime("%B %d, %Y")
  end

  def formatted_time(time)
    time.strftime("%I:%M %p")
  end
end
