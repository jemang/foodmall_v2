module ApplicationHelper

  def loading
    "<span class='loading dots'>Loading </span>".html_safe
  end

  def confirm_message
    "Are you sure?"
  end

end
