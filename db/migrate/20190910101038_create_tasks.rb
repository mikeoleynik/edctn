class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string  :title, null: false
      t.text    :body, null: false
      t.integer :difficulty, null: false
      t.integer :theme_id, null: false, index: true

      t.timestamps
    end
  end
end
