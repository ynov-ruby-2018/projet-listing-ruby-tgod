class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :picture, as: :imageable
  accepts_nested_attributes_for :picture #pour permettre l'upload de fichier
end
