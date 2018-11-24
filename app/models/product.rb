class Product < ApplicationRecord
  enum status: [:available, :not_available]
end
