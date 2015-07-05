class ChangeCityNamesToPolish < ActiveRecord::Migration

  NAMES_MAP = {
    'Warsaw': 'Warszawa',
    'Wroclaw': 'Wrocław',
    'Krakow': 'Kraków',
    'Poznan': 'Poznań',
    'Bydgoszcz': 'Bydgoszcz',
    'Bialystok': 'Białystok',
    'Gorzow Wielkopolski': 'Gorzów Wielkopolski',
    'Kielce': 'Kielce',
    'Lublin': 'Lublin',
    'Lodz': 'Łódź',
    'Olsztyn': 'Olsztyn',
    'Opole': 'Opole',
    'Rzeszow': 'Rzeszów',
    'Szczecin': 'Szczecin',
    'Torun': 'Toruń',
    'Gdansk': 'Gdańsk',
    'Katowice': 'Katowice'
  }

  def up
    NAMES_MAP.each do |old_name, new_name|
      city = City.find_by_name(old_name)
      city.update(name: new_name) if city
    end
  end

  def down
    NAMES_MAP.each do |old_name, new_name|
      city = City.find_by_name(new_name)
      city.update(name: old_name) if city
    end
  end
end
