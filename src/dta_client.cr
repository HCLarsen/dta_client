require "http/client"

# TODO: Write documentation for `DtaClient`
class DTAClient
  VERSION = "0.1.0"

  # :nodoc:
  HEADERS = ["access-token", "client", "expiry", "uid"]

  property base_path : String
  getter auth_params = HTTP::Headers.new

  def initialize(@base_path : String)
  end

  def sign_in(email : String, password : String) : Bool
    params = HTTP::Headers{"email" => email, "password" => password}
    response = HTTP::Client.post(@base_path + "/sign_in", headers: params)

    response.headers.each do |k, v|
      if HEADERS.includes?(k)
        @auth_params[k] = v
      end
    end

    return response.success?
  end
end
