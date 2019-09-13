class UpfinishListValidator < BaseValidator
  validates :name, presence: true
  validates :description, presence: true
end