class ChangeLikesToMatches < ActiveRecord::Migration[6.0]

  def up
    rename_column :likes, :user_id, :user_1
    rename_column :likes, :liked_user_id, :user_2
    add_column :likes, :user_1_approves, :boolean
    add_column :likes, :user_2_approves, :boolean

    rename_table :likes, :matches
  end

  def down
    rename_table :matches, :likes

    rename_column :likes, :user_1, :user_id
    rename_column :likes, :user_2, :liked_user_id
    remove_column :likes, :user_1_approves
    remove_column :likes, :user_2_approves
  end
end
