# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

User.destroy_all
Instrument.destroy_all

user = URI.open('https://avatars.githubusercontent.com/u/78362026?v=4')
alan = User.create(email: 'alan@lewagon.com', password: 'password')
alan.photo.attach(io: user, filename: 'Alan.png', content_type: 'image/png')
user2 = URI.open('https://avatars.githubusercontent.com/u/63310460?v=4')
titou = User.create(email: 'titou@lewagon.com', password: 'password')
titou.photo.attach(io: user2, filename: 'Titouan.png', content_type: 'image/png')
user3 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1657602360/yndjqzd5dulcqltvwpzm.jpg')
momo = User.create(email: 'momo@lewagon.com', password: 'password')
momo.photo.attach(io: user3, filename: 'Mohamed.png', content_type: 'image/png')

file = URI.open('http://loremflickr.com/400/400/guitar')
instrument = Instrument.new(name: 'Guitar', category: 'Instrument a corde', brand: 'Yamaha', age: '5 months', price: '5$', adress: "16 Villa Gaudelet, Paris", user: alan)
instrument.photos.attach(io: file, filename: 'guitar.png', content_type: 'image/png')

file2 = URI.open('http://loremflickr.com/400/400/piano')
instrument2 = Instrument.new(name: 'Piano', category: 'Instrument a corde frappées', brand: 'Bechstein', age: '12 months', adress: "36 Rue de la Clef, 59800 Lille", price: '5$', user: alan)
instrument2.photos.attach(io: file2, filename: 'piano.png', content_type: 'image/png')

file3 = URI.open('http://loremflickr.com/400/400/violon')
instrument3 = Instrument.new(name: 'Violon', category: 'Instrument a corde', brand: 'Stradivarius', age: '5 months', adress: "160 Rue Faventines, 26000 Valence", price: '5$', user: alan)
instrument3.photos.attach(io: file3, filename: 'piano.png', content_type: 'image/png')

file4 = URI.open('http://loremflickr.com/400/400/flute')
instrument4 = Instrument.new(name: 'Flute', category: 'Instrument a vent en cuivre', brand: 'Cora', age: '1 months', adress: "La Lauvette, 06340 Nice", price: '5$', user: alan)
instrument4.photos.attach(io: file4, filename: 'flute.png', content_type: 'image/png')

file5 = URI.open('http://loremflickr.com/400/400/drum')
instrument5 = Instrument.new(name: 'Drum', category: 'Instrument percussion', brand: 'Yamaha', age: '7 months', price: '5$', adress: "24 route de Valenciennes, Orsinval", user: alan)
instrument5.photos.attach(io: file5, filename: 'drum.png', content_type: 'image/png')

instrument.save!
instrument2.save!
instrument3.save!
instrument4.save!
instrument5.save!
