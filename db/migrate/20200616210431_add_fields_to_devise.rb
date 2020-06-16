class AddFieldsToDevise < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :education, :string
    add_column :users, :location, :string
    add_column :users, :description, :text
  end
end
