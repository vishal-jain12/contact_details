module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      next unless message.is_a? String
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type.to_sym)} alert-dismissable", style: "margin: 10px;") do
        concat content_tag(:button, 'x', class: "close", style: "font-size: 18px;", data: { dismiss: 'alert' })
        concat content_tag(:p, message, style: "margin: 0px;")
      end)
    end
    nil
  end
end