class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.boolean :allday
      t.text :memo

      t.timestamps
    end
  end
end
