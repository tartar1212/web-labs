# frozen_string_literal: true

require './main'

puts 'Создаем объект CarWithBasicInfo'
basic_car = CarWithBasicInfo.new(2015, 80_000)
puts "Год выпуска: #{basic_car.release_year}, пробег: #{basic_car.mileage}\n" \
"Средний пробег за год: #{basic_car.average_mileage}"

puts 'Создаем объект CarWithExtendedInfo'
extended_car = CarWithExtendedInfo.new('LWRUP', 'Tesla', 2018, 60_000, 'Elon Musk')
puts "Номер авто: #{extended_car.number}, Марка: #{extended_car.brand}, Владелец: #{extended_car.owner}, " \
"Год выпуска: #{extended_car.release_year}, пробег: #{extended_car.mileage}\n" \
"Средний пробег за год: #{extended_car.average_mileage}"
