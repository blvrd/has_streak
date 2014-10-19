require 'spec_helper'

describe HasStreak::Streakable do
  context "#streak" do
    let(:user) { User.create(name: "garrett") }
    it "returns a streak of 3" do
      user.posts.create(content: "hello", created_at: 2.days.ago)
      user.posts.create(content: "hello", created_at: 1.day.ago)
      user.posts.create(content: "hello", created_at: DateTime.current)

      expect(user.streak(:posts)).to eq(3)
    end

    it "returns streak of zero" do
      user.posts.create(content: "hello", created_at: 4.days.ago)
      user.posts.create(content: "hello", created_at: 3.days.ago)
      user.posts.create(content: "hello", created_at: 2.days.ago)

      expect(user.streak(:posts)).to eq(0)
    end

    context "spanning two months" do
      it "returns a streak of 2" do
        Timecop.freeze(DateTime.current.beginning_of_month)
        user.posts.create(content: "hello", created_at: 1.day.ago)
        user.posts.create(content: "hello", created_at: DateTime.current)

        expect(user.streak(:posts)).to eq(2)
      end
    end
  end
end
