class Message < ApplicationRecord
  belongs_to :user

  validates :contenu , presence: true
end
