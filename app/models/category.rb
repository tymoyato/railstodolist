class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :lists, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
end
