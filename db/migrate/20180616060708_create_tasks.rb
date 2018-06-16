class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true
      t.string :title
      t.datetime :due_on
      t.integer :priority
      t.boolean :is_done

      t.timestamps
    end
  end
end
