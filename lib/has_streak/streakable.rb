module HasStreak
  module Streakable
    def has_streak
      include InstanceMethods
    end

    module InstanceMethods
      def streak(association)
        return if self.send(association).blank?

        days = get_days(association)
        determine_consecutive_days(days)
      end

      private

      def get_days(association)
        self.send(association).order("created_at DESC").pluck(:created_at).map(&:to_date).uniq
      end

      def determine_consecutive_days(days)
        streak = 1
        days.each_with_index do |day, index|
          break unless days.first == Date.current
          if days[index+1] == day.yesterday
            streak += 1
          else
            break
          end
        end
        streak
      end

    end
  end
end
