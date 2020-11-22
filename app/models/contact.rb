class Contact < ApplicationRecord
  has_many :contact_views, dependent: :destroy

  mount_uploader :image, ImageUploader
  is_impressionable

  belongs_to :user

  validates_presence_of :first_name, :last_name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true, message: 'Please enter valid email'
  validates :mobile_number, length: { minimum: 10, maximum: 10 }, format: { with: /[0-9]+/ }, allow_blank: true
  validates :landline_number, length: { minimum: 10, maximum: 10 }, format: { with: /[0-9]+/ }, allow_blank: true

  validate :image_size_validation, if: Proc.new { |p| p.image.present? }

  scope :desc, -> { order(created_at: :desc) }
  scope :asc, -> { order(created_at: :desc) }

  def name
    self.first_name.to_s + ' ' + self.middle_name.to_s + ' ' + self.last_name.to_s
  end

  def self.search(search_params)
    return self.all unless search_params
    contacts = self.where("contacts.first_name LIKE ? OR contacts.middle_name LIKE ? OR contacts.last_name LIKE ? OR contacts.mobile_number LIKE ? OR contacts.landline_number LIKE ?", "%#{search_params}%", "%#{search_params}%", "%#{search_params}%", "%#{search_params}%", "%#{search_params}%")
  end
   
  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
