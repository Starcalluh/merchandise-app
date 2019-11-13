class CreateConsumersTable < ActiveRecord::Migration[5.2]
  def change
    create_table(:consumers) do | table |
      table.string(:name)
    end
  end
end
