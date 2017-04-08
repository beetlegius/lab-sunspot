# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170407181933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "casinos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "nombre_completo"
    t.string   "nickname"
    t.string   "tipo_documento"
    t.string   "documento"
    t.string   "direccion_descripcion"
    t.string   "direccion_calle"
    t.string   "direccion_numero"
    t.string   "direccion_piso"
    t.string   "direccion_departamento"
    t.string   "localidad"
    t.string   "codigo_postal"
    t.string   "provincia"
    t.string   "pais"
    t.string   "telefono"
    t.string   "email"
    t.string   "tipo_fiscal"
    t.string   "numero_fiscal"
    t.string   "sexo"
    t.date     "nacimiento"
    t.boolean  "es_representante"
    t.boolean  "es_anonimo"
    t.boolean  "esta_presente"
    t.string   "codigo"
    t.integer  "movimientos_como_emisor_count",   default: 0, null: false
    t.integer  "movimientos_como_receptor_count", default: 0, null: false
    t.integer  "casino_id"
    t.integer  "representante_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["casino_id"], name: "index_clientes_on_casino_id", using: :btree
    t.index ["codigo"], name: "index_clientes_on_codigo", unique: true, using: :btree
    t.index ["representante_id"], name: "index_clientes_on_representante_id", using: :btree
  end

  create_table "movimientos", force: :cascade do |t|
    t.datetime "hora"
    t.string   "tipo"
    t.boolean  "esta_confirmado", default: false
    t.string   "motivo"
    t.string   "tipo_operacion"
    t.text     "observaciones"
    t.string   "emisor_type"
    t.integer  "emisor_id"
    t.string   "receptor_type"
    t.integer  "receptor_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["emisor_id", "emisor_type"], name: "index_movimientos_on_emisor_id_and_emisor_type", using: :btree
    t.index ["emisor_type", "emisor_id"], name: "index_movimientos_on_emisor_type_and_emisor_id", using: :btree
    t.index ["receptor_id", "receptor_type"], name: "index_movimientos_on_receptor_id_and_receptor_type", using: :btree
    t.index ["receptor_type", "receptor_id"], name: "index_movimientos_on_receptor_type_and_receptor_id", using: :btree
  end

end
