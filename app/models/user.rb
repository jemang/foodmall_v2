class User < ApplicationRecord 

  include DeviseExtended

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates :email, presence: :true, uniqueness: true
  validate :correct_document_mime_type

  enum role: [:normal_user, :staff, :admin]
  enum status: [:active, :deactive, :suspend]

  has_one_attached :avatar


  def correct_document_mime_type
    # if avatar.attached? && !avatar.content_type.in?(%w(application/msword application/pdf))
      # errors.add(:avatar, 'Must be a PDF or a DOC file')
    if avatar.attached? && !avatar.content_type.in?(%w(image/png image/jpg image/jpeg))
      errors.add(:avatar, 'must be a image type only')
    end
  end

end
