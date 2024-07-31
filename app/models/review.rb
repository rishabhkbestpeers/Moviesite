class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :content,presence: true, length: { maximum: 100}
  validates :rating ,presence: true, comparison: { greater_than: 0, less_than_or_equal_to: 5 }
end
