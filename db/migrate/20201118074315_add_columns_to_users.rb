class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string  # 追記
    add_column :users, :postal_code, :string # 追記
    add_column :users, :address, :text # 追記
    add_column :users, :description, :text # 追記
  end
end
