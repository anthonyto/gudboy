json.array! @transactions do |transaction|
  json.extract! transaction, :id, :amount, :date, :category_id
end