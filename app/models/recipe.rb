class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :cream, presence: true
  validates :procedure, presence: true  
  validates :image, presence: true
end
