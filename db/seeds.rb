USERS = [
  ['Prueba', 'prueba@hotmail.com', '1234567'],
  ['Melissa', 'mcastorena0316@gmail.com', '1234567']
]

USERS.each do |user|
  User.create(name: user[0], email: user[1], password: user[2])
end

PROPERTIES = [
  ['Casa en Colinas', 'Lorem Ipsum', 10_000, 'available', 'Carlos Martinez', 'carlos@hotmail.com', { start_date: '2020-01-02T16:45:27+02:00', end_date: '2020-01-02T16:45:27+02:00'}],
  ['Departamento Cancun', 'Lorem Ipsum', 30_000, 'published', 'Maria Viera', 'maria@hotmail.com', { start_date: '2021-03-15T08:45:27+02:00', end_date: '2021-03-16T18:00:00+02:00'}]
]
PROPERTIES.each do |property|
  Property.create(name: property[0], description: property[1], rental_price: property[2],
                  status: property[3] , tenant_name: property[4], tenant_email: property[5],
                  tenant_availability: property[6])
end



