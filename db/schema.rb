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

ActiveRecord::Schema.define(version: 2018_12_30_215743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bebidas", force: :cascade do |t|
    t.string "nome"
    t.string "categoria"
    t.string "possiveis_tamanhos", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "preco_base"
    t.string "picture_url"
  end

  create_table "burgers", force: :cascade do |t|
    t.string "nome"
    t.string "ingredientes_base", default: [], array: true
    t.decimal "preco_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_url"
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "rua"
    t.integer "numero"
    t.string "comp"
    t.string "referencia"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cidade"
    t.string "estado"
    t.index ["user_id"], name: "index_enderecos_on_user_id"
  end

  create_table "ingredientepedidos", force: :cascade do |t|
    t.integer "quantidade"
    t.bigint "pedidoburgers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedidoburgers_id"], name: "index_ingredientepedidos_on_pedidoburgers_id"
  end

  create_table "ingredientes", force: :cascade do |t|
    t.string "nome"
    t.string "categoria"
    t.decimal "preco_normal"
    t.decimal "preco_extra"
    t.string "possiveis_quantidades", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidobebidas", force: :cascade do |t|
    t.integer "quantidade"
    t.string "bebida"
    t.bigint "pedido_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "preco"
    t.index ["pedido_id"], name: "index_pedidobebidas_on_pedido_id"
  end

  create_table "pedidoburgers", force: :cascade do |t|
    t.integer "quantidade"
    t.string "burger"
    t.bigint "pedido_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ingredientes", default: [], array: true
    t.string "quantidades", default: [], array: true
    t.decimal "preco"
    t.index ["pedido_id"], name: "index_pedidoburgers_on_pedido_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "status"
    t.datetime "horario"
    t.integer "tempoentrega"
    t.bigint "user_id"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "enderecoid"
    t.decimal "precototal"
    t.index ["user_id"], name: "index_pedidos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "enderecos", "users"
  add_foreign_key "ingredientepedidos", "pedidoburgers", column: "pedidoburgers_id"
  add_foreign_key "pedidobebidas", "pedidos"
  add_foreign_key "pedidoburgers", "pedidos"
  add_foreign_key "pedidos", "users"
end
