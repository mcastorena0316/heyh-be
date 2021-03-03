module Request
  module JsonHelpers
    def json
      JSON.parse(last_response.body)
    end
  end

  module AuthHelpers
    def auth_headers(user)
      payload = { user_id: user.id }
      payload[:exp] =  15.minutes.from_now.to_i
      token = JWT.encode(payload, 's3cr3t')
      {
        'Authorization': token
      }
    end
  end
end