# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'google_drive'

session = GoogleDrive::Session.from_service_account_key(ENV['GOOGLE_DRIVE_CREDENTIALS'])
ws = session.spreadsheet_by_key("1Pn1_-YvROQJEZDxL2At_aSjYn9tMXo826yk0EvC_Gig").worksheets[0]

User.delete_all


usertable = []
i = 0
(2..ws.num_rows).each do |row|
    hashuser = {}
    hashuser[:first_name] = ws[row,1]
    hashuser[:last_name] = ws[row,2]
    hashuser [:female] = ws[row,3]
    hashuser[:email] = ws[row,4]
    hashuser[:funfact] = ws[row,7]
    hashuser [:linkedin] = ws[row,8]
    hashuser [:dev] = ws[row,9]
    hashuser [:product] = ws[row,10]
    hashuser [:growth] = ws[row,12]
    hashuser [:sales] = ws[row,11]
    hashuser [:ops] = ws[row,13]
    hashuser[:photopath] = ws[row,5] + ws[row,6] + ".jpg"
    usertable << hashuser
    binding.pry
    i += 1
end

usertable.each do |user|
  created_user = User.create(
    :first_name => user[:first_name],
    :last_name => user[:last_name],
    :email => user[:email],
    :password => "123456",
    :isfemale => user[:female],
    :linkedin_url => user[:linkedin],
    :dev => user[:dev],
    :growth => user[:growth],
    :product => user[:product],
    :sales => user[:sales],
    :fun_fact_one => user[:funfact]
    # :avatar => File.open("#{Rails.root}/app/assets/images/medium/#{user[:photopath]}", 'rb')
  )
  binding.pry
  photo = session.file_by_title(user[:photopath])
  photo.download_to_file("#{Rails.root}/app/assets/images/medium/#{user[:photopath]}")
  binding.pry
  created_user.avatar = File.open("#{Rails.root}/app/assets/images/medium/#{user[:photopath]}", 'rb')
  created_user.save

end



# User.all.each do |user|
#   img = File.open(File.join(Rails.root, "app/assets/images/medium", "#{user.first_name}#{user.last_name}.jpg"),'rb')
#   user.update(avatar: img)
# end

# User.create(
#   first_name: "Adrien",
#   last_name: "FOLIE",
#   isfemale: false,
#   email: "adrien@mail.com",
#   password: "123456",
#   fun_fact_one: "Je connais l'intégrale de Léo Ferré")
#
#
#   avatar: File.open("#{Rails.root}/app/assets/images/medium/AdrienFOLIE.jpg", 'rb')
# )
#
# User.create(
#   first_name: "Alexandre",
#   last_name: "HERCOVA",
#   isfemale: false,
#   email: "alexandre@mail.com",
#   password: "123456",
#   fun_fact_one: "Je connais 360 recettes de cocktail",
#   avatar: File.open("#{Rails.root}/app/assets/images/medium/AlexandreHERCOVA.jpg", 'rb')
# )
#
# User.create(
#   first_name: "Amin",
#   last_name: "BOUHASSOUNE",
#   isfemale: false,
#   email: "amin@mail.com",
#   password: "123456",
#   fun_fact_one: "J'ai écrit les paroles d'une chanson de Booba",
#   avatar: File.open("#{Rails.root}/app/assets/images/medium/AminBOUHASSOUNE.jpg", 'rb')
# )
#
# User.create(
#   first_name: "Anam",
#   last_name: "NASIR",
#   email: "anam@mail.com",
#   isfemale: true,
#   password: "123456",
#   fun_fact_one: "J'ai sauté 10 fois en parachute",
#   avatar: File.open("#{Rails.root}/app/assets/images/medium/AnamNASIR.jpg", 'rb')
# )
#
# User.create(
#   first_name: "Angélique",
#   last_name: "FEY",
#   isfemale: true,
#   email: "angélique@mail.com",
#   password: "123456",
#   fun_fact_one: "Je suis pizzaïolo le mercredi soir",
#   avatar: File.open("#{Rails.root}/app/assets/images/medium/AngéliqueFEY.jpg", 'rb')
# )


#
#
# seedarray.each do |user_params|
#   avatar = configure_permitted_parameters.delete(:avatar)
#   user = User.find_or_create_by(configure_permitted_parameters)
#   user.avatar = avatar
# end







# User.all.each do |user|
#     user.avatar = File.open("#{Rails.root}/app/assets/images/medium/#{ws[user,4]}#{user.last_name}.JPG", 'rb')
#    :avatar => File.open("#{Rails.root}/app/assets/images/medium/#{user[3]}#{user[1]}.JPG", 'rb')
# avatar: File.open("#{Rails.root}/app/assets/images/medium/lion-avatar.png", 'rb')
# end
