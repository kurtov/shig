module ApplicationHelper
  def flash_messages
    flash.each do |msg_type, text|
      #доступные значения twr_type: success, info, warning, danger
      #http://getbootstrap.com/components/#alerts
      twr_type = case msg_type
        when :notice then :info
        when :alert then :danger
        when :success then :success
        when :warning then :warning
        else :info  
      end
      concat(content_tag :div, text, class: "alert alert-#{msg_type}")
    end
    nil
  end
end
