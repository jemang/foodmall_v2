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

  def image_views(file, size="100x100")
    if file.attached?
      if file.variable?
        link_to image_tag(file.variant(resize: size)), file, target: :blank
      elsif file.previewable?
        link_to image_tag(file.preview(resize: size)), rails_blob_path(file, disposition: :attachment)
      elsif file.image?
        link_to image_tag(file, width: 400), file
      else
        link_to file.filename, rails_blob_path(file, disposition: :attachment)
      end
    else
      image_tag "/No_Image.jpg", size: size
    end
  end  

end
