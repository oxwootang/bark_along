class Bark < ApplicationRecord

  validates :title, presence: true
  validates :location, presence: true
  validates :content, presence: true

  belongs_to :user

end
