class AddReservasForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservas, :solicitante_id
    add_column :reservas, :user_id, :integer
    add_foreign_key :reservas, :users
  end
end
