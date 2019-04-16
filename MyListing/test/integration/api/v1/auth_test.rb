require 'test_helper'

describe "Auth" do

  before  do
    @user = User.create(
        email: 'email@domaine.com',
        password: 'password123',
        password_confirmation: 'password123',
        is_admin: true
    )
  end

  it "Return a token if i'm logged in" do
    post api_v1_auth_path, {
        email: @user.email,
        password: 'password123'
    }
    assert_equal 200 , last_response.status
  end

  focus
  it "Return error if password is invalid" do
    post api_v1_auth_path, {
        email: @user.email,
        password: 'pqwes'
    }
    assert_equal 401 , last_response.status
  end

end