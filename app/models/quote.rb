class Quote < ApplicationRecord
  belongs_to :user
  validates :body, :author, presence: true
  has_one_attached :picture
end
