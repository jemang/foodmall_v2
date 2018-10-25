module LinkHelper
  def icon_button url_path, option={}
    default_class = %w(btn btn-fab btn-default btn-inverted icon material-icons ) << option[:class]
    option[:class] = default_class.join(" ")   
    option[:data] = {} unless  option[:data]
    icon = option[:icon]
    option.delete(:icon) 
    option[:data][:disable_with] = "#{content_tag(:i, 'more_horiz', class: 'icon material-icons').html_safe}"
    link_to icon, url_path, option
  end

  def default_action(show: {}, edit: {}, delete: {}, dropdown: false, confirm: true)
    #make default remote true
    if show.any?
      show[:remote] = true unless show.key?(:remote)
    end

    if edit.any?
      edit[:remote] = true unless edit.key?(:remote)
    end

    if delete.any?
      delete[:remote] = true unless delete.key?(:remote)
    end

    #dropdown style
    if dropdown
      buttons = "<div class='dropdown'>
                <a class='btn btn-secondary btn-fab btn-sm dropdown-toggle no-caret' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                  <i class='mi'> more_vertical </i>
                </a>
                <div class='dropdown-menu dropdown-menu-right' aria-labelledby='dropdown-btn'> "
          if show.any?
            buttons += "#{link_to 'Show', show[:url], data: {remote: show[:remote], disable_with: loading}, class: 'dropdown-item'}"
          end
          if edit.any?
            buttons += "#{link_to 'Edit', edit[:url], data: {remote: edit[:remote], disable_with: loading}, class: 'dropdown-item'}"
          end
          if delete.any?
            if confirm
              buttons +=  "#{link_to 'Delete', delete[:url], data: {remote: delete[:remote], confirm: confirm_message, method: :delete, disable_with: loading}, class: 'dropdown-item'}"
            else
              buttons +=  "#{link_to 'Delete', delete[:url], data: {remote: delete[:remote], method: :delete, disable_with: loading}, class: 'dropdown-item'}"
            end
          end  
      buttons += "</div></div>"

    else
      #button style
      buttons = "<div class='btn-group btn-group-sm btn-group-fluid float-right'>"
      if show.any?
        buttons += "#{link_to_icons 'pages', show[:url], disable_with: "...",  data: {remote: show[:remote]}, class: 'btn-xs bg-white text-grey'}" 
      end
      if edit.any?
        buttons += "#{link_to_icons 'edit', edit[:url], disable_with: "...", data: {remote: edit[:remote]}, class: 'btn-xs bg-white text-grey'}" 
      end
      if delete.any?
        if confirm
          buttons += "#{link_to_icons 'delete', delete[:url], disable_with: "...", data: {remote: delete[:remote], confirm: confirm_message, method: :delete}, class: 'btn-xs bg-white text-grey'}"
        else
          buttons += "#{link_to_icons 'delete', delete[:url], disable_with: "...", data: {remote: delete[:remote], method: :delete}, class: 'btn-xs bg-white text-grey'}"
        end
      end
      buttons += "</div>"

    end
    return buttons
  end


  def back_button(show: nil, hide: nil, url: nil )
    if url.present?
      "<a class='btn-back btn btn-fab btn-lg mi text-black' href='#{url}' data-toggle='tooltip' data-placement='right' title='back'>
        keyboard_backspace
      </a>".html_safe
    else
      "<a class='btn-back btn btn-fab btn-lg mi text-black' href='#' data-show='##{show}' data-hide='##{hide}' data-turbolinks='false' data-toggle='tooltip' data-placement='right' title='back'>
        keyboard_backspace
      </a>".html_safe
    end
  end


  def link_to_icon icon, url_path, option={}
    default_class = %w(link-icon icon material-icons) << option[:class]
    option[:class] = default_class.join(" ")   
    option[:data] = {} unless  option[:data]
    #icon = content_tag(:i, icon, class: "material-icons").html_safe
    case icon
    when "pages"
      title = "Show"
    else
      title = icon.titleize
    end
    option[:title] = title
    
    option[:data][:toggle] = "tooltip"
    option[:data][:disable_with] = "#{content_tag(:i, 'more_horiz', class: 'icon material-icons').html_safe}"
    link_to icon, url_path, option
  end


  def upload_button url_path, option={}
    default_class = %w(btn btn-fab bg-orange) << option[:class]
    option[:class] = default_class.join(" ")
    option[:data] = {} unless  option[:data]
    option[:data][:disable_with] = "#{content_tag(:i, 'more_horiz', class: 'icon material-icons').html_safe}"
    option[:data][:toggle] = "tooltip"
    option[:data][:title] = "upload"
    link_to content_tag(:i, "cloud_upload", class: "icon material-icons"), url_path, option
  end

  def modal_close_button
    "<button aria-label='Close' class='close' data-dismiss='modal' type='button'>
      <span aria-hidden='true'> &times;</span>
    </button>".html_safe
  end

  def link_to_icons icon, url_path, option={}
    default_class = %w(link-icon btn btn-outline-primary) << option[:class]
    option[:class] = default_class.join(" ")
    option[:data] = {} unless  option[:data]
    #icon = content_tag(:i, icon, class: "material-icons").html_safe
    case icon
    when "pages"
      title = "Show"
    else
      title = icon.titleize
    end
    option[:title] = title
    
    option[:data][:toggle] = "tooltip"
    option[:data][:disable_with] = "#{content_tag(:i, 'more_horiz', class: 'icon material-icons').html_safe}"
    
    link_to(url_path, option) do
      "<i class='material-icons'>#{icon}</i>".html_safe
    end
  end

  def new_action?
    ["new", "create"].include?(params[:action])
  end

  def edit_action?
    ["edit", "update"].include?(params[:action])
  end

  # json.url default_action(  show:   {url: dns_geolocation_path(geo)},
  #     			        edit:   {url: edit_dns_geolocation_path(geo)},
  #                               delete: {url: dns_geolocation_path(geo)})
  
end