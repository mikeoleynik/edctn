class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fullname, null: false, default: ''
      t.boolean :mentor, default: true
    end
  end
end
