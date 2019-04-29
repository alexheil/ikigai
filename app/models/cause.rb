class Cause < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :element

  has_one :product

end
