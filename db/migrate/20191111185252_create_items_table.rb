class CreateItemsTable < ActiveRecord::Migration[5.2]
  def change
    create_table (:items) do | table |
      table.string(:brand)
      table.string(:item_name)
      table.integer(:quanity)
      table.float(:cost)
    end
  end
end
