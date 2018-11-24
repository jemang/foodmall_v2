json.set! :data do
  json.array! @products do |product|
    json.extract! product, :id, :item_name, :price, :description, :status, :created_at, :updated_at
    json.url default_action(  show:   {url: product_path(product)},
                              edit:   {url: edit_product_path(product)},
                              delete: {url: product_path(product)})
  end
end