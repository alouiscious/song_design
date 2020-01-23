class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      t.string :email
      t.integer :phone
      t.string :instrument

      t.timestamps null: false
    end
  end
end
