json.array!(@categories) do |category|
  json.extract! category, ::name
end
