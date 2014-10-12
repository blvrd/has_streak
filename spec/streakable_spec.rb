require 'spec_helper'

describe HasStreak::Streakable do
  context "#streak" do
    let(:user) { User.create(name: "garrett") }

    it "returns a streak of 3" do
      oldest = Post.create(content: "hello", user_id: user.id, created_at: 2.days.ago)
      old = Post.create(content: "hello", user_id: user.id, created_at: 1.day.ago)
      new = Post.create(content: "hello", user_id: user.id)

      expect(user.streak(:posts)).to eq(3)
    end
  end
end
