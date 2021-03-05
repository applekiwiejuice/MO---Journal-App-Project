class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_description
      t.datetime :task_deadline
      t.references :category

      t.timestamps
    end
  end
end
