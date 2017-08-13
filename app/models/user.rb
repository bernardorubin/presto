class User < ApplicationRecord
  has_many :requisitions
  has_many :personal_references
end
