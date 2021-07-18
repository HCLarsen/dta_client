require "minitest/autorun"

require "./webmocks.cr"

require "/../src/dta_client"

class DTAClientTest < Minitest::Test
  def test_initalizes_dta_client
    base_path = "localhost:3000/api/v1/auth"
    client = DTAClient.new(base_path)

    assert_equal base_path, client.base_path
  end

  def test_signs_in_and_authenticates
    base_path = "localhost:3000/api/v1/auth"
    client = DTAClient.new(base_path)

    success = client.sign_in(email: "corps@example.com", password: "testing123")
    assert success

    params = client.auth_params
    assert_equal "08Na79ohCtHjDl2MtHEEAQ", params["access-token"]
    assert_equal "9eKqFG5UY9f6yLh7TVc8rA", params["client"]
    assert_equal "1627764337", params["expiry"]
    assert_equal "corps@example.com", params["uid"]

    response = HTTP::Client.get("localhost:3000/api/v1/users/1", params)
    assert response.success?
  end

  def test_returns_false_for_incorrect_credentials
    base_path = "localhost:3000/api/v1/auth"
    client = DTAClient.new(base_path)

    success = client.sign_in(email: "corps@example.com", password: "wrongpassword")
    refute success
  end
end
