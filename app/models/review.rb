# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  ratyrate_rateable 'quality'
end
