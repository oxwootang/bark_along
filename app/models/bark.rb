class Bark < ApplicationRecord

  validates :title, presence: true
  validates :location, presence: true
  validates :content, presence: true

end
