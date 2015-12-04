

Given(/^my favorites stations are ([\d, ]+)$/) do |pattern|
  Velibe::KvStore.reset_favorite_stations *pattern.split(', ')
end