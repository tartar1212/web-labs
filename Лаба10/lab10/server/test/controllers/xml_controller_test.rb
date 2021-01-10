require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
test 'check rss format' do
    get '/', params: { search_range: '1 4 3 16 25', format: :rss }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/rss'
  end
  
end
