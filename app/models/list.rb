class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy  # Deleting a list deletes its bookmarks
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
end
