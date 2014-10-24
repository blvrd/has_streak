require "has_streak/version"
require "has_streak/streak"
require "has_streak/streakable"
require "active_record"

module HasStreak
  ActiveRecord::Base.extend Streakable
end
