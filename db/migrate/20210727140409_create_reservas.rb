class CreateReservas < ActiveRecord::Migration[6.1]
  def change
    create_table :reservas do |t|
      t.string :solicitante
      t.datetime :data
      t.integer :solicitante_id
      t.string :descricao

      t.timestamps
    end
  end
end
