json.extract! post, :id, :creator, :title, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
