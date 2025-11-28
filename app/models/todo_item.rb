class TodoItem < ApplicationRecord
  validates :title, presence: true

  def completed?
    completed
  end
end
