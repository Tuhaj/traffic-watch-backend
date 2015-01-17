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
                                            { lat: '52.0994115', lng: '21.024054'  },
                                            { lat: '52.16483',   lng: '20.9315745' },
                                            { lat: '52.2448711', lng: '20.9015523' },
                                            { lat: '52.3212418', lng: '20.9135241' },
                                            { lat: '52.356973',  lng: '20.9401855' },
                                            { lat: '52.3074503', lng: '21.0810085' }
                                          ])
