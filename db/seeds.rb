# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:email => 'p@p', :first_name => '亮', :last_name => '諸葛',:first_name_kana => 'リョウ' , :last_name_kana => 'ショカツ', :nickname => '名軍師',  :password => '111111', :introduction => '今です', :admin => 'true' )