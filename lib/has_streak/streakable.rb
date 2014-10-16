module HasStreak
  module Streakable
    def has_streak
      include InstanceMethods
    end

    module InstanceMethods
      def streak(association)
        return if self.send(association).blank?

        days = get_days_in_order(association)
        determine_consecutive_days(days)
      end

      private

      # this converts all the created_at days from DateTime to Date objects
      # also, uniq prevents multiple entries on the same day from 'breaking a streak'
      def get_days_in_order(association)
        self.send(association).order(:created_at).pluck(:created_at).map(&:to_date).uniq
      end

      # to_streaks returns the dates array converted to an array of streaks
      def to_streaks(dates)
        return dates if dates.empty?

        streaks = [ [ dates.shift ] ]
  
        while dates.any?
          current_streak = streaks.last
          current_date = dates.shift
    
          if current_streak.last.tomorrow == current_date
            current_streak.push current_date
          else
            streaks.push [current_date]
          end
        end
  
        return streaks
      end
      
      # longest_streak returns the longest streak, most recent if there's a tie
      # if you want the oldest tie for longest, switch streak_two[0] and streak_one[0]
      def longest_streak(dates)
        to_streaks(date_time_array).sort do |streak_one, streak_two|
          [ streak_two.length, streak_two[0] ] <=> [ streak_one.length, streak_one[0] ]
        end
      end
      
      # now we only have to ask 'how long is the longest streak?'
      def determine_consecutive_days(days)
        longest_streak(days).length
      end
    end
  end
end
