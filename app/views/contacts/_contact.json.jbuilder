json.extract! contact, :id, :name, :room_number, :content, :created_at, :updated_at
json.url contact_url(contact, format: :json)
