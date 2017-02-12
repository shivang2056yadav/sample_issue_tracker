json.array!(@issues) do |issue|
  json.extract! issue, :id, :subject, :description, :assigned_to_id
  json.url issue_url(issue, format: :json)
end
