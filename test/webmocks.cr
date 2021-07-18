require "webmock"

WebMock.stub(:post, "localhost:3000/api/v1/auth/sign_in").with(headers: {"email" => "corps@example.com", "password" => "testing123"}).to_return(
  status: 200,
  headers: HTTP::Headers{"Content-Type" => "application/json; charset=utf-8", "access-token" => "08Na79ohCtHjDl2MtHEEAQ", "token-type" => "Bearer", "client" => "9eKqFG5UY9f6yLh7TVc8rA", "expiry" => "1627764337", "uid" => "corps@example.com", "ETag" => "W/\"269c0ca4ce19a74b626bafc7dd478006\"", "Cache-Control" => "max-age=0, private, must-revalidate", "X-Request-Id" => "4289c4ea-94b7-4620-99fd-43189222d535", "X-Runtime" => "0.469958", "Connection" => "close", "Transfer-Encoding" => "chunked"},
  body: %({"data":{"id":1,"email":"corps@example.com","provider":"email","uid":"corps@example.com","allow_password_change":false,"name":null,"nickname":null,"image":null,"admin":false,"tier":0}}))

WebMock.stub(:get, "localhost:3000/api/v1/users/1").to_return(
  status: 200,
  headers: HTTP::Headers{"Content-Type" => "application/json; charset=utf-8", "access-token" => "", "token-type" => "Bearer", "client" => "9eKqFG5UY9f6yLh7TVc8rA", "expiry" => "", "uid" => "corps@example.com", "ETag" => "W/\"98506726f4341502aaede55ad6667aeb\"", "Cache-Control" => "max-age=0, private, must-revalidate", "X-Request-Id" => "17a461e2-c399-4aac-9c2d-7c2ba0186dd9", "X-Runtime" => "0.088219", "Connection" => "close", "Transfer-Encoding" => "chunked"},
  body: %({"id":1,"provider":"email","uid":"corps@example.com","allow_password_change":false,"name":null,"nickname":null,"image":null,"email":"corps@example.com","created_at":"2021-06-24T01:21:09.250Z","updated_at":"2021-07-17T20:45:37.179Z","admin":false,"tier":0}))

WebMock.stub(:post, "localhost:3000/api/v1/auth/sign_in").to_return(
  status: 401,
  headers: HTTP::Headers{"Content-Type" => "application/json; charset=utf-8", "Cache-Control" => "no-cache", "X-Request-Id" => "7cb5f779-b64a-47f4-81c4-7db8d8a4a96a", "X-Runtime" => "0.750521", "Connection" => "close", "Transfer-Encoding" => "chunked"},
  body: %({"success":false,"errors":["Invalid login credentials. Please try again."]}))
