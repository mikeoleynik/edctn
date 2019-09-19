RSpec::Matchers.define :have_jsonapi_errors do
  match do |actual|
    actual.dig("errors").present?
  end
end