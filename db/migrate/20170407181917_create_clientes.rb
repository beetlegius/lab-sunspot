class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :apellido
      t.string :nombre_completo
      t.string :nickname
      t.string :tipo_documento
      t.string :documento
      t.string :direccion_descripcion
      t.string :direccion_calle
      t.string :direccion_numero
      t.string :direccion_piso
      t.string :direccion_departamento
      t.string :localidad
      t.string :codigo_postal
      t.string :provincia
      t.string :pais
      t.string :telefono
      t.string :email
      t.string :tipo_fiscal
      t.string :numero_fiscal
      t.string :sexo
      t.date :nacimiento
      t.boolean :es_representante
      t.boolean :es_anonimo
      t.boolean :esta_presente
      t.string :codigo


      t.integer :movimientos_como_emisor_count, default: 0, null: false
      t.integer :movimientos_como_receptor_count, default: 0, null: false

      t.belongs_to :casino, :representante
      t.timestamps
    end
    add_index :clientes, :codigo, unique: true
  end
end
