class CreateNode < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.belongs_to :theme, null: false
      t.belongs_to :task, null: false
      t.boolean :access, default: false
    end
  end
end
