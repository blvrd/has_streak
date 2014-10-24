module HasStreak
  module Streakable
    def has_streak
      include InstanceMethods
    end

    module InstanceMethods
      def streak(association)
        days = get_days(association)
        determine_consecutive_days(days)
      end

      private

      def get_days(association)
        self.send(association).order("created_at DESC").pluck(:created_at).map(&:to_date).uniq
      end

      def determine_consecutive_days(days)
        streak = first_day_in_collection_is_today?(days) ? 1 : 0
        days.each_with_index do |day, index|
          break unless first_day_in_collection_is_today?(days)
          if days[index+1] == day.yesterday
            streak += 1
          else
            break
          end
        end
        streak
      end

      def first_day_in_collection_is_today?(days)
        days.first == Date.current
      end

    end
  end
end
