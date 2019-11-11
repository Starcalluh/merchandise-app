class CreateTransactionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table(:transactions) do |table|
      table.string(:shipping_location)
      table.integer(:order_number)
      table.integer(:item_id)
      table.integer(:consumer_id)
    end
  end
end
