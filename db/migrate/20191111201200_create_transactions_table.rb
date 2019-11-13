class CreateTransactionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table(:transactions) do |table|
      table.integer(:item_id)
      table.integer(:consumer_id)
    end
  end
end
