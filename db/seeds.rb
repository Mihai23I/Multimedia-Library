# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Example User',
             email: 'admin@example.com',
             password: '123456',
             password_confirmation: '123456',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

50.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@example.com"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

cities = ["Adjud", "Aiud", "Alba Iulia", "Alexandria", "Arad", "Bacău", "Baia Mare", "Băilești", "Bârlad", "Beiuș", "Bistrița", "Blaj", "Botoșani", "Brad", "Brăila", "Brașov", "București", "Buzău", "Calafat", "Călărași", "Câmpia Turzii", "Câmpina", "Câmpulung", "Câmpulung Moldovenesc", "Caracal", "Caransebeș", "Carei", "Cluj Napoca", "Codlea", "Constanța", "Craiova", "Curtea de Argeș", "Dej", "Deva", "Dorohoi", "Drăgășani", "Drobeta-Turnu Severin", "Făgăraș", "Fălticeni", "Fetești", "Focșani", "Galați", "Gheorgheni", "Gherla", "Giurgiu", "Hunedoara", "Huși", "Iași", "Lugoj", "Lupeni", "Mangalia", "Marghita", "Medgidia", "Mediaș", "Miercurea Ciuc", "Moinești", "Moreni", "Motru", "Odorheiu Secuiesc", "Oltenița", "Onești", "Oradea", "Orăștie", "Orșova", "Pașcani", "Petroșani", "Piatra Neamț", "Pitești", "Ploiești", "Rădăuți", "Râmnicu Sărat", "Râmnicu Vâlcea", "Reghin", "Reșița", "Roman", "Roșiorii de Vede", "Săcele", "Salonta", "Satu Mare", "Sebeș", "Sfântu Gheorghe", "Sibiu", "Sighetu Marmației", "Sighișoara", "Slatina", "Slobozia", "Suceava", "Târgoviște", "Târgu Jiu", "Târgu Mureș", "Târgu Secuiesc", "Târnăveni", "Tecuci", "Timișoara", "Toplița", "Tulcea", "Turda", "Turnu Măgurele", "Urziceni", "Vaslui", "Vatra Dornei", "Vulcan", "Zalău"]

cities.each do |city|
  City.create(name: city, country: "Romania")
end
