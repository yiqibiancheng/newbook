require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a friendship works withou raising an exception" do
	assert_nothing_raised do
    UserFriendship.create user: users(:eric), friend: users(:elina)
    end
    end

    test "that creating a friendship based on user id and friend id works" do
    UserFriendship.create user_id: users(:eric).id, friend_id: users(:elina).id
    assert users(:eric).friends.include?(users(:elina))
    end
end
