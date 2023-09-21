class UserGameSerializer
  include JSONAPI::Serializer

  attributes :user_id, :score, :created_at

  belongs_to :game
end
