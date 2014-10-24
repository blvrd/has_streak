module HasStreak
  module Streakable
    def has_streak
      include InstanceMethods
    end

    module InstanceMethods
      def streak(association)
        Streak.new(self, association).length
      end
    end
  end
end
