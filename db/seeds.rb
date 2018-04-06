# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'google_drive'

session = GoogleDrive::Session.from_service_account_key(
    "driveconfig.json")
ws = session.spreadsheet_by_key("1Pn1_-YvROQJEZDxL2At_aSjYn9tMXo826yk0EvC_Gig").worksheets[0]

User.delete_all


# usertable = []
# i = 0
# (2..ws.num_rows).each do |row|
#     hashuser = {}
#     hashuser[:first_name] = ws[row,1]
#     hashuser[:last_name] = ws[row,2]
#     hashuser[:email] = ws[row,3]
#     usertable << hashuser
#     byebug
#     i += 1
# end
#
# usertable.each do |user|
#   User.create(
#     :first_name => user[0],
#     :last_name => user[1],
#     :email => user[2],
#     :password => "123456"
#   )
# end
#
# User.all.each do |user|
#   img = File.open(File.join(Rails.root, "app/assets/images/medium", "#{user.first_name}#{user.last_name}.jpg"),'rb')
#   user.update(avatar: img)
# end

User.create(
  first_name: "Adrien",
  last_name: "FOLIE",
  email: "adrien@mail.com",
  password: "123456",
  avatar: File.open("#{Rails.root}/app/assets/images/medium/AdrienFOLIE.jpg", 'rb')
)

User.create(
  first_name: "Alexandre",
  last_name: "HERCOVA",
  email: "alexandre@mail.com",
  password: "123456",
  avatar: File.open("#{Rails.root}/app/assets/images/medium/AlexandreHERCOVA.jpg", 'rb')
)

User.create(
  first_name: "Amin",
  last_name: "BOUHASSOUNE",
  email: "amin@mail.com",
  password: "123456",
  avatar: File.open("#{Rails.root}/app/assets/images/medium/AminBOUHASSOUNE.jpg", 'rb')
)

User.create(
  first_name: "Anam",
  last_name: "NASIR",
  email: "anam@mail.com",
  password: "123456",
  avatar: File.open("#{Rails.root}/app/assets/images/medium/AnamNASIR.jpg", 'rb')
)

User.create(
  first_name: "Angélique",
  last_name: "FEY",
  email: "angélique@mail.com",
  password: "123456",
  avatar: File.open("#{Rails.root}/app/assets/images/medium/AngéliqueFEY.jpg", 'rb')
)


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
