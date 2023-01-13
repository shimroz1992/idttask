# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_113_130_437) do
  create_table 'average_caches', force: :cascade do |t|
    t.integer 'rater_id'
    t.string 'rateable_type'
    t.integer 'rateable_id'
    t.float 'avg', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[rateable_type rateable_id], name: 'index_average_caches_on_rateable'
    t.index ['rater_id'], name: 'index_average_caches_on_rater_id'
  end

  create_table 'friendly_id_slugs', force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at'
    t.index %w[slug sluggable_type scope], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope',
                                           unique: true
    t.index %w[slug sluggable_type], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type'
    t.index %w[sluggable_type sluggable_id], name: 'index_friendly_id_slugs_on_sluggable_type_and_sluggable_id'
  end

  create_table 'overall_averages', force: :cascade do |t|
    t.string 'rateable_type'
    t.integer 'rateable_id'
    t.float 'overall_avg', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[rateable_type rateable_id], name: 'index_overall_averages_on_rateable'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'image'
    t.string 'slug'
    t.index ['slug'], name: 'index_products_on_slug', unique: true
  end

  create_table 'rates', force: :cascade do |t|
    t.integer 'rater_id'
    t.string 'rateable_type'
    t.integer 'rateable_id'
    t.float 'stars', null: false
    t.string 'dimension'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[rateable_type rateable_id], name: 'index_rates_on_rateable'
    t.index ['rater_id'], name: 'index_rates_on_rater_id'
  end

  create_table 'rating_caches', force: :cascade do |t|
    t.string 'cacheable_type'
    t.integer 'cacheable_id'
    t.float 'avg', null: false
    t.integer 'qty', null: false
    t.string 'dimension'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[cacheable_id cacheable_type], name: 'index_rating_caches_on_cacheable_id_and_cacheable_type'
    t.index %w[cacheable_type cacheable_id], name: 'index_rating_caches_on_cacheable'
  end

  create_table 'reviews', force: :cascade do |t|
    t.text 'description'
    t.string 'name'
    t.integer 'product_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id', null: false
    t.index ['product_id'], name: 'index_reviews_on_product_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'reviews', 'products'
  add_foreign_key 'reviews', 'users'
end
