class Task < ApplicationRecord
    belongs_to :category
    validates :task_name, presence: true
    validates :task_description, presence: true
    # validates :task_deadline, presence: true
end
