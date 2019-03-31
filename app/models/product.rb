class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  
end
