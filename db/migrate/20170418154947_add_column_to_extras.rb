class AddColumnToExtras < ActiveRecord::Migration[5.0]
  def change
    add_reference :extras, :order, index: true
  end
end
