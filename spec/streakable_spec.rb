require 'spec_helper'

describe HasStreak::Streakable do
  context "#streak" do
    let(:user) { User.create(name: "garrett") }

    context "when a user posted on each of the last three days" do
      it "returns a streak of 3" do
        user.posts.create(content: "hello", created_at: 2.days.ago)
        user.posts.create(content: "hello", created_at: 1.day.ago)
        user.posts.create(content: "hello", created_at: DateTime.current)

        expect(user.streak(:posts)).to eq(3)
      end
    end

    context "when a user didn't post today" do
      it "returns streak of zero" do
        user.posts.create(content: "hello", created_at: 3.days.ago)
        user.posts.create(content: "hello", created_at: 2.days.ago)
        user.posts.create(content: "hello", created_at: 1.days.ago)

        expect(user.streak(:posts)).to eq(0)
      end
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
