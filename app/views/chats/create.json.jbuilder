json.content @message.content
json.date @message.created_at.to_s(:datetime_jp)
json.user_id @message.user.id
json.user_name @message.user.nickname
json.id @message.id