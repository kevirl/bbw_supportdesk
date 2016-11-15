class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :position

      t.timestamps null: false
    end
  end
end
