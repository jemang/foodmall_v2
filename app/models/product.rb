class Product < ApplicationRecord
  enum status: [:available, :not_available]

  validate :correct_document_mime_type
  has_one_attached :image


  def correct_document_mime_type
    if image.attached? && !image.content_type.in?(%w(image/png image/jpg image/jpeg))
      errors.add(:image, 'must be a image type only')
    end
  end
end
