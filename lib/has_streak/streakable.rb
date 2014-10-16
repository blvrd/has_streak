module HasStreak
  module Streakable
    def has_streak
      include InstanceMethods
    end

    module InstanceMethods
      def streak(association)
        return if self.send(association).blank?

        days = get_days_in_descending_order(association)
        determine_consecutive_days(days)
      end

      private

      def get_days_in_descending_order(association)
        self.send(association).order(:created_at).pluck(:created_at).map(&:to_date).uniq
      end

      def determine_consecutive_days(days)
        days.each_with_index.inject(0) do |streak, (day, index)|
          streak += 1 if day + 1 == day.tomorrow
          streak
        end
      end

    end
  end
end
