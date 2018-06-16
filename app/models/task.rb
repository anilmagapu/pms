class Task < ApplicationRecord
  belongs_to :project, optional: true
  has_many :comments, dependent: :destroy
end
