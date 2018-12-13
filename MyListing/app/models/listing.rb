class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :picture, as: :imageable
  accepts_nested_attributes_for :picture #pour permettre l'upload de fichier

  def self.search(keywords)
    if keywords.blank?
      self.all.order('created_at DESC')
    else
      self.where('titre LIKE ?', "%#{keywords}%") #ce qui est contenu dans la variable keywords peut etre se trouver n'importe ou dans le titre
    end
  end
end
