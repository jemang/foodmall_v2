json.set! :data do
  json.array! @products do |product|
    json.extract! product, :id, :item_name, :price, :description, :status, :created_at, :updated_at
    json.url  "
              #{link_to 'Show', product_path(product), data: {remote: true}}
              #{link_to 'Edit', edit_product_path(product), data: {remote: true}}
              #{link_to 'Destroy', product_path(product), data: { remote: true, confirm: confirm_message, disable_with: loading, method: :delete }}
              "
  end
end