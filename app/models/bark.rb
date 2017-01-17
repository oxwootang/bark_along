class Bark < ApplicationRecord

  validates :title, null: false
  validates :location, null: false
  validates :content, null: false

end
