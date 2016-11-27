json.extract! ticket, :id, :ttype, :email, :status, :title, :caselog, :category, :product, :solution, :account_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)