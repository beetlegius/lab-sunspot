class CreateMovimientos < ActiveRecord::Migration[5.0]
  def change
    create_table :movimientos do |t|
      t.datetime :hora
      t.string :tipo
      t.boolean :esta_confirmado, default: false
      t.string :motivo, :tipo_operacion
      t.text :observaciones

      t.references :emisor, :receptor, polymorphic: true

      t.timestamps
    end
    add_index :movimientos, [:emisor_id, :emisor_type]
    add_index :movimientos, [:receptor_id, :receptor_type]
  end
end
