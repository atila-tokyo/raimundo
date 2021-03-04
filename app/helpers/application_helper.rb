module ApplicationHelper
  def add_tooltip_to_label(label, tooltip)
    result = "".html_safe
    result << label
    result << " <abbr title='".html_safe
    result << tooltip
    result << "'><span class='glyphicon glyphicon-question-sign'></span></abbr>".html_safe
    result
  end
end
