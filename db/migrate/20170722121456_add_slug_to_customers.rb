class AddSlugToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :slug, :string
    add_index :customers, :slug, unique: true
  end
end
