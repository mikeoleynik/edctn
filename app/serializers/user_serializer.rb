class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :fullname
end
