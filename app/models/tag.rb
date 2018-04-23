class Tag < ApplicationRecord
  has_many :tagging
  has_many :stories, through: :tagging
end
