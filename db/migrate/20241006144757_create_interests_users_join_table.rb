class CreateInterestsUsersJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :users, :interests do |t|
      t.index [:user_id, :interest_id], unique: true
    end
  end
end
