class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :ttype, :null => false, :default => 'Support'
      t.string :email
      t.string :status, :null => false, :default => 'Open'
      t.string :title
      t.text :caselog
      t.string :category
      t.string :product
      t.text :solution
      t.references :account

      t.timestamps null: false
    end
    add_foreign_key :tickets, :accounts
    add_index :tickets, [:account_id, :created_at]
  end
end

