# frozen_string_literal: true

class CreateOverallAverages < ActiveRecord::Migration[7.0]
  def change
    create_table :overall_averages do |t|
      t.belongs_to :rateable, polymorphic: true
      t.float :overall_avg, null: false
      t.timestamps
    end
  end

  # def self.down
  #   drop_table :overall_averages
  # end
end
