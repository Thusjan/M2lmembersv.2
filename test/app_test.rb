require_relative 'test_helper'

describe "Main pages" do
  def test_homepage
    get '/'
    assert_equal last_response.status, 200
  end

  def test_posts_new
    get '/posts/new'
    assert_equal last_response.status, 200
  end
end
