require 'spec_helper'

describe HasStreak::Streakable do
  context "#streak" do
    let(:user) { User.create(name: "garrett") }

    it "returns a streak of 3" do
      user.posts.create(content: "hello", created_at: 2.days.ago)
      user.posts.create(content: "hello", created_at: 1.day.ago)
      user.posts.create(content: "hello")

      expect(user.streak(:posts)).to eq(3)
    end

    context "spanning two months" do
      it "returns a streak of 2" do
        user.posts.create(content: "hello", created_at: Date.new.end_of_month)
        user.posts.create(content: "hello", created_at: Date.new.end_of_month.advance(days: 1))

        expect(user.streak(:posts)).to eq(2)
      end
    end
  end
end
