class ChangeDefaultValueForUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :mentor, from: true, to: false
  end
end
