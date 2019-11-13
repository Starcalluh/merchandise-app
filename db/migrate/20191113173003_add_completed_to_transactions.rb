class AddCompletedToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :completed, :boolean
  end
end
