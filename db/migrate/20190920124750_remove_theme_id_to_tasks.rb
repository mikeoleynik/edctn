class RemoveThemeIdToTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :theme_id, :integer, null: false, index: true
  end
end
