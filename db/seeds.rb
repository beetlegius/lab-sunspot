# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

from_dates = (1.year.ago.to_date..1.month.ago.to_date).to_a
to_dates = (1.month.ago.to_date..Date.today.to_date).to_a
nacimientos = (50.years.ago.to_date..20.years.ago.to_date).to_a

nombres = Lipsum.paragraphs[2].to_s.split(" ")
tipos_documento = ['dni', 'ru', 'pasaporte']

casino = Casino.find_or_create_by nombre: "H2C"

150.times do
  cliente = casino.clientes.create! nombre: nombres.sample,
    apellido: nombres.sample,
    nickname: nombres.sample,
    tipo_documento: tipos_documento.sample,
    documento: rand(4000000).to_s,
    direccion_calle: rand(90).to_s,
    direccion_numero: rand(4000).to_s,
    localidad: nombres.sample,
    codigo_postal: rand(2000).to_s,
    provincia: nombres.sample,
    pais: 'Argentina',
    telefono: '+54 221 453-1882',
    email: "#{nombres.sample}@hotmail.com",
    tipo_fiscal: 'CUIT',
    numero_fiscal: rand(4000000).to_s,
    sexo: ['M', 'F'].sample,
    nacimiento: nacimientos.sample,
    es_representante: false,
    es_anonimo: false,
    esta_presente: [false, false, false, false, false, false, false, false, true].sample

  # cliente.update! codigo: cliente.id
  puts cliente.nombre_completo
end
