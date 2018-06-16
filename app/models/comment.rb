class Comment < ApplicationRecord
  belongs_to :task, optional: true
end
