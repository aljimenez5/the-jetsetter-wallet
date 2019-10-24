# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@data = File.read("#{Rails.root}/public/countriesToCities.json")
@data_hash = JSON.parse(@data)

@data_hash.keys.each do |country|
    @country = Country.find_or_create_by(name: country)
    City.create(name: @data_hash["#{country}"][0], country_id: @country.id)
    City.create(name: @data_hash["#{country}"][1], country_id: @country.id)
    City.create(name: @data_hash["#{country}"][2], country_id: @country.id)
    City.create(name: @data_hash["#{country}"][3], country_id: @country.id)

end
