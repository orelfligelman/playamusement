json.array!(@ordertransactions) do |ordertransaction|
  json.extract! ordertransaction, :id
  json.url ordertransaction_url(ordertransaction, format: :json)
end
