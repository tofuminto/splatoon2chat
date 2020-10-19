json.extract! chat, :id, :title, :content, :created_at, :updated_at
json.url chat_url(chat, format: :json)
