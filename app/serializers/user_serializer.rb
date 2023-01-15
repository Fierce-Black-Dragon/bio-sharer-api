class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :username, :email, :full_name, :info, :image_url
end
