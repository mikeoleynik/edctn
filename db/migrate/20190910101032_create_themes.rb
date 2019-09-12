class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
