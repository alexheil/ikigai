class Cause < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :element

  has_many :products

end
