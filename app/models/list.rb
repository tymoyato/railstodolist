class List < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :items, dependent: :destroy

  validates :name, :description, presence: true, uniqueness: true
  validates :category_id, presence: true
end
