class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_length
    trails.sum(:length)
  end

  def average_trail_length
    trails.average(:length)
  end

  def longest_trail
    trails.maximum(:length)
  end

  def shortest_trail
    trails.minimum(:length)
  end
end
