class Item < ApplicationRecord
  belongs_to :list

  validates :name, :description, presence: true, uniqueness: true
  validates :list_id, presence: true
end
