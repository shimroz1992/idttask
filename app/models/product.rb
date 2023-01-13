# frozen_string_literal: true

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :reviews, dependent: :destroy
  validates :name, :description, presence: true
  extend FriendlyId
  friendly_id :name, use: :slugged
end
