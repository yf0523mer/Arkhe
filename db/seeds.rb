# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:email => 'p@p', :first_name => '亮', :last_name => '諸葛',:first_name_kana => 'りょう' , :last_name_kana => 'しょかつ', :nickname => '名軍師',  :password => '111111', :introduction => '今です', :admin => 'true' )
User.create(:email => 'a@a', :first_name => '学', :last_name => '木村',:first_name_kana => 'まなぶ' , :last_name_kana => 'きむら', :nickname => 'にんじん',  :password => '111111', :introduction => '僕達みたいなのにとって、散歩は続かないものなんだ。', :admin => 'false' )
User.create(:email => 'z@z', :first_name => '友望子', :last_name => '福地',:first_name_kana => 'ゆみこ' , :last_name_kana => 'ふくち', :nickname => 'イノセント',  :password => '111111', :introduction => 'テスト', :admin => 'false' )
