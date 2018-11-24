module ApplicationHelper

  def loading
    "<span class='loading dots'>Loading </span>".html_safe
  end

  def confirm_message
    "Are you sure?"
  end

  def new_record_action?
    params[:action] == "new" or params[:action] == "create"
  end

  def edit_record_action?
    params[:action] == "edit" or params[:action] == "update"
  end

end
