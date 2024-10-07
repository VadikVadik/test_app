class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :patronymic
      t.string :full_name
      t.integer :age, null: false
      t.string :email, null: false
      t.string :nationality, null: false
      t.string :country, null: false
      t.string :gender, null: false

      t.timestamps
    end
  end
end
