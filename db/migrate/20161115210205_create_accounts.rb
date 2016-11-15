class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
