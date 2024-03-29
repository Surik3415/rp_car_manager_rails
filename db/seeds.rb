# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 10.times do
#   Car.create(make: Faker::Vehicle.make, model: Faker::Vehicle.model,
#   year: Faker::Vehicle.year, price: Faker::Number.between(from: 10_000, to: 25_000))
# end

# FactoryBot.create(:car)
Car.create(car_id: '1ec46226-330f-11ec-8d3d-0242ac130003',
           make: 'Ford',
           model: 'Fusion',
           year: 2017,
           odometer: 65_000,
           price: 18_000,
           description: 'Selling a good car',
           date_added: '18/09/21')
Car.create(car_id: '32e2db70-330f-11ec-8d3d-0242ac130003',
           make: 'Chevrolet',
           model: 'Volt',
           year: 2015,
           odometer: 35_000,
           price: 14_000,
           description: 'Great choice',
           date_added: '15/07/21')
Car.create(car_id: '4a1e7876-330f-11ec-8d3d-0242ac130003',
           make: 'Skoda',
           model: 'Octavia Tour',
           year: 2010,
           odometer: 60_000,
           price: 8700,
           description: 'For fans and connoisseurs of the skoda brand',
           date_added: '15/08/21')
Car.create(car_id: '418f99b0-330f-11ec-8d3d-0242ac130003',
           make: 'Lexus',
           model: 'ES 350',
           year: 2008,
           odometer: 121_000,
           price: 13_000,
           description: 'Sell the car in an ideal condition',
           date_added: '10/08/21')
Car.create(car_id: '52444580-330f-11ec-8d3d-0242ac130003',
           make: 'Infiniti',
           model: 'Q50',
           year: 2017,
           odometer: 32_000,
           price: 21_600,
           description: 'The condition of the car, as with a car dealership',
           date_added: '20/08/21')
Car.create(car_id: '693f8416-330f-11ec-8d3d-0242ac130003',
           make: 'Audi',
           model: 'A4',
           year: 2012,
           odometer: 103_000,
           price: 12_500,
           description: 'Audi a4 quattro premium 2012',
           date_added: '21/08/21')
Car.create(car_id: '7073efd8-330f-11ec-8d3d-0242ac130003',
           make: 'Ford',
           model: 'Focus',
           year: 2017,
           odometer: 103_000,
           price: 19_000,
           description: 'Like new',
           date_added: '24/08/21')
Car.create(car_id: '7935e180-330f-11ec-8d3d-0242ac130003',
           make: 'Audi',
           model: 'Q7',
           year: 2012,
           odometer: 180_000,
           price: 22_800,
           description: 'Audi q7 3.0 tdi climate control cruise control',
           date_added: '24/08/21')
Car.create(car_id: '808db9e4-330f-11ec-8d3d-0242ac130003',
           make: 'BMW',
           model: 'X5',
           year: 2003,
           odometer: 245_000,
           price: 10_500,
           description: 'Car in very good condition, LPG installed',
           date_added: '28/09/21')
Car.create(car_id: '8841f970-330f-11ec-8d3d-0242ac130003',
           make: 'Renault',
           model: 'Megane',
           year: 2018,
           odometer: 245_000,
           price: 10_500,
           description: 'Car in very good condition, LPG installed',
           date_added: '28/09/21')
Car.create(car_id: '8f724eb6-330f-11ec-8d3d-0242ac130003',
           make: 'Volkswagen',
           model: 'Passat',
           year: 2013,
           odometer: 205_000,
           price: 12_200,
           description: 'Sell volkswagen passat b7 bluemotion technology',
           date_added: '10/10/21')
Car.create(car_id: '9676171a-330f-11ec-8d3d-0242ac130003',
           make: 'BMW',
           model: 'X5',
           year: 2014,
           odometer: 130_000,
           price: 29_900,
           description: 'The car is in perfect condition, fully serviced',
           date_added: '8/10/21')
Car.create(car_id: '9e6da960-330f-11ec-8d3d-0242ac130003',
           make: 'Volkswagen',
           model: 'Tiguan',
           year: 2013,
           odometer: 157_000,
           price: 15_600,
           description: 'Official car',
           date_added: '3/10/21')
Car.create(car_id: 'a64dd240-330f-11ec-8d3d-0242ac130003',
           make: 'Peugeot',
           model: '3008',
           year: 2013,
           odometer: 160_000,
           price: 10_650,
           description: 'Official car',
           date_added: '1/10/21')
