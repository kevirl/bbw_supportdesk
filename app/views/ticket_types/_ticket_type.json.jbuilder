json.extract! ticket_type, :id, :type, :created_at, :updated_at
json.url ticket_type_url(ticket_type, format: :json)