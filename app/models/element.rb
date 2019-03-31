class Element < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :causes, dependent: :destroy

end
