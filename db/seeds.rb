# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# City.create([{ name: 'Warsaw', center: '52.2301036,21.0116003'}])
City.find_by_name('Warsaw').markers.create([{ lat: '52.2220515', lng: '21.2504114' },
                                            { lat: '52.1490187', lng: '21.1888543' },
                                            { lat: '52.0994115', lng: '21.024054' }
                                          ])