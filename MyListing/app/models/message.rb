class Message < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :contenu , presence: true
end
