# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# City.create([{ name: 'Warsaw', center: '52.2301036,21.0116003'}])
# City.find_by_name('Warsaw').markers.create([{ lat: '52.2220515', lng: '21.2504114' },
#                                             { lat: '52.1490187', lng: '21.1888543' },
#                                             { lat: '52.0994115', lng: '21.024054'  },
#                                             { lat: '52.16483',   lng: '20.9315745' },
#                                             { lat: '52.2448711', lng: '20.9015523' },
#                                             { lat: '52.3212418', lng: '20.9135241' },
#                                             { lat: '52.356973',  lng: '20.9401855' },
#                                             { lat: '52.3074503', lng: '21.0810085' }
#                                           ])

# City.create([{ name: 'Cracow', center: '50.0467657,20.0048731'}])
# City.find_by_name('Cracow').markers.create([{ lat: '49.9810971',lng: '19.9110386' },
#                                             { lat: '49.992679', lng: '19.8494015' },
#                                             { lat: '50.099548', lng: '19.867424'  },
#                                             { lat: '50.109368', lng: '19.96573'   },
#                                             { lat: '50.081278', lng: '20.191488'  },
#                                             { lat: '50.049038', lng: '20.213422'  },
#                                             { lat: '50.016203', lng: '20.069159'  },
#                                             { lat: '49.998717', lng: '20.029236'  }
#                                           ])
# City.create([{ name: 'Danzig', center: '54.3610873,18.6900272'}])
# City.find_by_name('Danzig').markers.create([{ lat: '54.321192',  lng: '18.71591'   },
#                                             { lat: '54.2810494', lng: '18.6477175' },
#                                             { lat: '54.29036',   lng: '18.607763'  },
#                                             { lat: '54.316911',  lng: '18.548612'  },
#                                             { lat: '54.350347',  lng: '18.466504'  },
#                                             { lat: '54.436932',  lng: '18.487964'  },
#                                             { lat: '54.423868',  lng: '18.563683'  },
#                                           ])

# City.create([{ name: 'Wroclaw', center: '51.1270779,16.9918639'}])
# City.find_by_name('Wroclaw').markers.create([{ lat: '51.06372',   lng: '17.098708' },
#                                              { lat: '51.053232',  lng: '16.97808'  },
#                                              { lat: '51.081142',  lng: '16.928139' },
#                                              { lat: '51.153366',  lng: '16.816323' },
#                                              { lat: '51.20804',   lng: '16.964298' },
#                                              { lat: '51.181295',  lng: '17.026445' },
#                                              { lat: '51.16243',   lng: '17.155322' },
#                                              { lat: '51.091493',  lng: '17.162957' },
#                                             ])
# City.create([{ name: 'Katowice', center: '50.2136724,19.0071927'}])
# City.find_by_name('Katowice').markers.create([{ lat: '50.173894',  lng: '19.022515'},
#                                               { lat: '50.194969',  lng: '18.929979' },
#                                               { lat: '50.255433',  lng: '18.956713' },
#                                               { lat: '50.282506',  lng: '19.092401' },
#                                               { lat: '50.221836',  lng: '19.09618'  },
#                                               { lat: '50.275026',  lng: '18.960594' },
#                                             ])
# City.create([{ name: 'Poznan', center: '52.401971,16.914408'}])
# City.find_by_name('Poznan').markers.create([{ lat: '52.33878',   lng: '17.045514'},
#                                             { lat: '52.335875',  lng: '17.010855' },
#                                             { lat: '52.353842',  lng: '16.901587' },
#                                             { lat: '52.349021',  lng: '16.834644' },
#                                             { lat: '52.471522',  lng: '16.750269' },
#                                             { lat: '52.464942',  lng: '16.888355' },
#                                             { lat: '52.440451',  lng: '16.982233' },
#                                             { lat: '52.404761',  lng: '17.045639' }
#                                             ])
######################################################################################
City.create([{ name: 'Bydgoszcz', center: '53.1256872,18.0381825'}])
City.find_by_name('Bydgoszcz').markers.create([{ lat: '53.075401', lng: '18.137399'},
                                            { lat: '53.094574',   lng: '18.008474' },
                                            { lat: '53.154006',   lng: '17.89847'  },
                                            { lat: '53.171749',   lng: '17.947365' },
                                            { lat: '53.175034',   lng: '18.055579' },
                                            { lat: '53.185898',   lng: '18.172713' },
                                            { lat: '53.143844',   lng: '18.171888' },
                                            ])
City.create([{ name: 'Bialystok', center: '53.1276252,23.1560658'}])
City.find_by_name('Bialystok').markers.create([{ lat: '53.089663', lng: '23.24533'  },
                                            { lat: '53.090022',    lng: '23.114858' },
                                            { lat: '53.14673',     lng: '23.069376' },
                                            { lat: '53.16131',     lng: '23.071252' },
                                            { lat: '53.17411',     lng: '23.146747' },
                                            { lat: '53.125759',    lng: '23.228429' }
                                            ])
City.create([{ name: 'Gorzow Wielkopolski', center: '52.7313279,15.2182355'}])
City.find_by_name('Gorzow Wielkopolski').markers.create([
                                            { lat: '52.6935208', lng: '15.2848562' },
                                            { lat: '52.6912416', lng: '15.2284279' },
                                            { lat: '52.7036912', lng: '15.1957425' },
                                            { lat: '52.7116899', lng: '15.16148'   },
                                            { lat: '52.7539231', lng: '15.1484095' },
                                            { lat: '52.773989',  lng: '15.229984'  },
                                            { lat: '52.767645',  lng: '15.282527'  }
                                           ])
City.create([{ name: 'Kielce', center: '50.85404,20.6156413'}])
City.find_by_name('Kielce').markers.create([
                                             { lat: '50.8739453', lng: '20.67546'   },
                                             { lat: '50.8266721', lng: '20.6704389' },
                                             { lat: '50.7990406', lng: '20.6208395' },
                                             { lat: '50.8331945', lng: '20.5370741' },
                                             { lat: '50.8551034', lng: '20.5132775' },
                                             { lat: '50.8816457', lng: '20.5411081' },
                                             { lat: '50.905663',  lng: '20.5768244' },
                                             { lat: '50.9122421', lng: '20.6802128' }
                                            ])

City.create([{ name: 'Lublin', center: '51.218109,22.5637702'}])
City.find_by_name('Lublin').markers.create([
                                             { lat: '51.2814895', lng: '22.5756792' },
                                             { lat: '51.2635077', lng: '22.6316086' },
                                             { lat: '51.2396418', lng: '22.6492468' },
                                             { lat: '51.2143086', lng: '22.6455185' },
                                             { lat: '51.1749223', lng: '22.5854799' },
                                             { lat: '51.140974',  lng: '22.504292'  },
                                             { lat: '51.2158611', lng: '22.4546525' },
                                             { lat: '51.2710765', lng: '22.4809382' }
                                            ])
City.create([{ name: 'Lodz', center: '51.7731179,19.4805926'}])
City.find_by_name('Lodz').markers.create([
                                             { lat: '51.8383562', lng: '19.5536131' },
                                             { lat: '51.7926631', lng: '19.6196893' },
                                             { lat: '51.7304736', lng: '19.6282482' },
                                             { lat: '51.696751',  lng: '19.478681'  },
                                             { lat: '51.7026856', lng: '19.3618995' },
                                             { lat: '51.7529648', lng: '19.3742591' },
                                             { lat: '51.8128699', lng: '19.3391705' },
                                             { lat: '51.8313238', lng: '19.4243708' }
                                            ])

City.create([{ name: 'Olsztyn', center: '53.7760107,20.4656988'}])
City.find_by_name('Olsztyn').markers.create([
                                             { lat: '53.8245781', lng: '20.4755827' },
                                             { lat: '53.7790523', lng: '20.5579342' },
                                             { lat: '53.7480652', lng: '20.5478974' },
                                             { lat: '53.7331231', lng: '20.4953426' },
                                             { lat: '53.743121',  lng: '20.4567563' },
                                             { lat: '53.7715819', lng: '20.3993463' },
                                             { lat: '53.8086822', lng: '20.3879268' }
                                            ])

City.create([{ name: 'Opole', center: '50.6561115,17.9306866'}])
City.find_by_name('Opole').markers.create([
                                             { lat: '50.6973463', lng: '17.9602445' },
                                             { lat: '50.6713927', lng: '17.991916'  },
                                             { lat: '50.6289168', lng: '18.0312908' },
                                             { lat: '50.5883968', lng: '17.9864845' },
                                             { lat: '50.6395734', lng: '17.9093898' },
                                             { lat: '50.6409717', lng: '17.9056401' },
                                             { lat: '50.6879943', lng: '17.8349531' },
                                             { lat: '50.7138267', lng: '17.9029364' }
                                            ])

City.create([{ name: 'Rzeszow', center: '50.0054299,21.988455'}])
City.find_by_name('Rzeszow').markers.create([
                                             { lat: '50.0386621', lng: '22.0629024' },
                                             { lat: '49.9728062', lng: '22.0246916' },
                                             { lat: '49.9384203', lng: '21.9810199' },
                                             { lat: '49.9937129', lng: '21.9566869' },
                                             { lat: '50.063435',  lng: '21.9300579' },
                                             { lat: '50.072002',  lng: '22.0263171' },
                                             { lat: '50.0729764', lng: '22.0585089' }
                                            ])

City.create([{ name: 'Szczecin', center: '53.4296962,14.6246236'}])
City.find_by_name('Szczecin').markers.create([
                                             { lat: '53.4094661', lng: '14.7124713' },
                                             { lat: '53.3630679', lng: '14.7534876' },
                                             { lat: '53.3421367', lng: '14.7577738' },
                                             { lat: '53.3281544', lng: '14.5741337' },
                                             { lat: '53.393078',  lng: '14.4896796' },
                                             { lat: '53.4283443', lng: '14.4763994' },
                                             { lat: '53.4940885', lng: '14.4813829' }
                                            ])

City.create([{ name: 'Torun', center: '53.0133925,18.6015486'}])
City.find_by_name('Torun').markers.create([
                                             { lat: '53.0551154', lng: '18.616408'  },
                                             { lat: '53.0532888', lng: '18.7110069' },
                                             { lat: '53.0441918', lng: '18.7364718' },
                                             { lat: '52.9988088', lng: '18.696531'  },
                                             { lat: '52.9728602', lng: '18.6775678' },
                                             { lat: '52.9781545', lng: '18.5552537' },
                                             { lat: '53.0259227', lng: '18.5117858' },
                                             { lat: '53.0607768', lng: '18.5580217' }
                                            ])

City.create([{ name: 'Zielona Gora', center: '51.9276115,15.5214237'}])
City.find_by_name('Zielona Gora').markers.create([
                                             { lat: '52.001927',  lng: '15.6026839' },
                                             { lat: '51.9282482', lng: '15.6411763' },
                                             { lat: '51.8855801', lng: '15.6304072' },
                                             { lat: '51.8397245', lng: '15.5542647' },
                                             { lat: '51.882951',  lng: '15.4188024' },
                                             { lat: '51.9450545', lng: '15.4381143' },
                                             { lat: '52.0111137', lng: '15.4381572' }
                                            ])






