class CreateUserTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tasks do |t|
      t.belongs_to :user, null: false
      t.belongs_to :task, null: false
    end
  end
end
