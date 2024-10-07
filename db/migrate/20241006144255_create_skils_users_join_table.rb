class CreateSkilsUsersJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :users, :skils do |t|
      t.index [:user_id, :skil_id], unique: true
    end
  end
end
