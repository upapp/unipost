# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Country.create([{ name: 'romania' }, { name: 'austria' }, { name: 'germany' }])
City.create(
  [{ name: "Timisoara", country_id: Country.find_by(name: "romania").id },
  { name: "Resita", country_id: Country.find_by(name: "romania").id },
  { name: "Arad", country_id: Country.find_by(name: "romania").id },
  { name: "Berlin", country_id: Country.find_by(name: "germany").id },
  { name: "Hamburg", country_id: Country.find_by(name: "germany").id },
  { name: "Munich", country_id: Country.find_by(name: "germany").id },
  { name: "Vienn", country_id: Country.find_by(name: "austria").id },
  { name: "Graz", country_id: Country.find_by(name: "austria").id },
  { name: "Linz", country_id: Country.find_by(name: "austria").id },
  { name: "Salzburg", country_id: Country.find_by(name: "austria").id }]
)