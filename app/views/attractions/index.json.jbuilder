json.array!(@attractions) do |attraction|
  json.extract! attraction, :id, :bumper_cars, :arcade, :himalaya, :carousel, :ballocity, :lazer, :runner, :soft_play, :inflatabales
  json.url attraction_url(attraction, format: :json)
end
