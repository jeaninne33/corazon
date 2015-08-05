# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150805210354) do

  create_table "ayudas", force: :cascade do |t|
    t.string   "nombre",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "institution_id", limit: 4
  end

  add_index "ayudas", ["institution_id"], name: "index_ayudas_on_institution_id", using: :btree

  create_table "conclusions", force: :cascade do |t|
    t.string   "estado",     limit: 255
    t.date     "fecha"
    t.integer  "persona_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "solicitud",  limit: 255
  end

  create_table "economies", force: :cascade do |t|
    t.string   "sector",                  limit: 255
    t.string   "empresa",                 limit: 255
    t.string   "ingreso_familiar",        limit: 255
    t.string   "tipo_casa",               limit: 255
    t.string   "condiciones_de_vivienda", limit: 255
    t.string   "persona_hab",             limit: 255
    t.string   "cant_hijos",              limit: 255
    t.string   "enceres_compartidos",     limit: 255
    t.string   "adultos_mayores",         limit: 255
    t.string   "discapacitados",          limit: 255
    t.string   "enfermos",                limit: 255
    t.integer  "persona_id",              limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "pobreza_extrema",         limit: 1
    t.text     "descripcion",             limit: 65535
  end

  create_table "institucions", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string   "nombre1",    limit: 255
    t.string   "nombre2",    limit: 255
    t.string   "apellido1",  limit: 255
    t.string   "apellido2",  limit: 255
    t.string   "cedula",     limit: 255
    t.text     "direccion",  limit: 65535
    t.text     "referencia", limit: 65535
    t.string   "municipio",  limit: 255
    t.string   "parroquia",  limit: 255
    t.string   "telefono1",  limit: 255
    t.string   "telefono2",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "ayudas", "institutions"
end
