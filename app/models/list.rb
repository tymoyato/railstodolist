class List < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :items, dependent: :destroy
  has_many :users

  validates :name, :description, presence: true, uniqueness: true
  validates :category_id, presence: true

  include AASM

  aasm :whiny_transitions => false do
    state :draft, initial: true
    state :deleted

    event :delete do
      transitions from: [:draft], to: :delete, guard: :updelete_list_valid?
    end
  end

  def updelete_list_valid?
    UpdeleteListValidator.new(self).valid?
  end
end
