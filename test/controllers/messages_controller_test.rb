require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  fixtures :users
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test "should create my object" do
    post '/rooms/1/messages', params: { message: { user_id: 1, room_id: 1, content: 'test content' } }
    assert_response :success
  end
end
