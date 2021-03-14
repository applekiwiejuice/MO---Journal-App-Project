class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks

  validates :category_name, presence: true
  validates :category_description, presence: true
end
