module RequestMacros
  def json_response
    JSON.parse(response.body)
  end

  def get_token(email, password)
    GetToken.new(email: email, password: password).call
  end
end
