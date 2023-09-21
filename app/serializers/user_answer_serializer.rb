class UserAnswerSerializer
  include JSONAPI::Serializer

  attributes :user_game_id, :game_question_id, :question, :answer, :user_answer, :result 
end
