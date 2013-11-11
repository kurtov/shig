# encoding: utf-8
module ApplicationHelper
  def flash_messages
    flash.each do |msg_type, text|
      #доступные значения twr_type: success, info, warning, danger
      #http://getbootstrap.com/components/#alerts
      twr_type = case msg_type
        when :notice then :success #:info
        when :alert then :danger
        when :success then :success
        when :warning then :warning
        else :info  
      end
      concat(content_tag :div, text, class: "alert alert-#{twr_type}")
    end
    nil
  end
  
  def tab *args
    options = {}
    css_classes = []

    if args.last.is_a?(Hash)
      options = options.merge(args.pop)
    end
    options[:route] ||= args.first.to_s

    destination_url = options[:url] || Rails.application.routes.url_helpers.send("#{options[:route]}_path")

    link = link_to(options[:label], destination_url)

    selected = args.include?(controller.controller_name.to_sym)
    css_classes << 'active' if selected

    if options[:css_class]
      css_classes << options[:css_class]
    end

    content_tag('li', link, :class => css_classes.join(' '))
  end
end