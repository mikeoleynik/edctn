module RequestMacros
  def json_response
    JSON.parse(response.body)
  end
end
