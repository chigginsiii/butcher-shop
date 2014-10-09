# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# seed the Cow!

cow = Animal.create!(name: 'Cow')

['Chuck', 'Short Loin'].each do |pc|
  cow.primal_cuts.create!(:name => pc)
end

rib = cow.primal_cuts.create!(name: 'Rib')
['Prime Rib', 'Ribeye'].each do |cut|
  rib.cuts.create!(name: cut)
end

['Porterhouse', 'T-bone', 'Strip'].each do |cut|
  cow.cuts.create!(name: cut)
end

# seed the Pig!

pig = Animal.create!(name: 'Pig')

['Jowl', 'Ham'].each do |pc|
    pig.primal_cuts.create!(name: pc)
end

loin = pig.primal_cuts.create!(name: 'Loin')
['Loin Chop', 'Blade Roast'].each do |loin_cut|
  loin.cuts.create(name: loin_cut)
end

['Babyback Ribs', 'Spareribs', 'Hock'].each do |cut|
  pig.cuts.create!(name: cut)
end
