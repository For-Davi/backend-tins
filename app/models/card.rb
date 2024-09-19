class Card < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1 }, allow_blank: false
  validates :description, presence: true, length: { minimum: 1 }, allow_blank: false
end
