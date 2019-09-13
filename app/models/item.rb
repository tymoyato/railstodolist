class Item < ApplicationRecord
  belongs_to :list

  validates :name, :description, presence: true, uniqueness: true
  validates :list_id, presence: true

  include AASM

  aasm :whiny_transitions => false do
    state :draft, initial: true
    state :upfinish

    event :finished do
      transitions from: [:draft], to: :upfinish, guard: :upfinish_item_valid?
    end
  end

  def upfinish_item_valid?
    UpfinishItemValidator.new(self).valid?
  end
end
