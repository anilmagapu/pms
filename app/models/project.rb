class Project < ApplicationRecord
  belongs_to :user, optional:true
  has_many :tasks, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true

end
