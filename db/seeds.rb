# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:email => 'p@p', :first_name => '葉介', :last_name => '唐辺',:first_name_kana => 'ようすけ' , :last_name_kana => 'からべ', :nickname => '瀬戸口',  :password => '111111', :introduction => 'こんにちは', :admin => 'true' )
User.create(:email => 'a@a', :first_name => '御幸', :last_name => '目黒',:first_name_kana => 'みゆき' , :last_name_kana => 'めぐろ', :nickname => 'ミユキ',  :password => '111111', :introduction => '図書室', :admin => 'false' )
User.create(:email => 'z@z', :first_name => '友望子', :last_name => '福地',:first_name_kana => 'ゆみこ' , :last_name_kana => 'ふくち', :nickname => 'ふくっち',  :password => '111111', :introduction => 'テスト', :admin => 'false' )
User.create(:email => 'd@d', :first_name => '望美', :last_name => '高田',:first_name_kana => 'のぞみ' , :last_name_kana => 'たかだ', :nickname => 'ノゾミ',  :password => '111111', :introduction => '屋上', :admin => 'false' )
User.create(:email => 'c@c', :first_name => 'まひる', :last_name => '田町',:first_name_kana => 'まひる' , :last_name_kana => 'たまち', :nickname => 'マヒル',  :password => '111111', :introduction => '校庭', :admin => 'false' )
User.create(:email => 'f@f', :first_name => '睦月', :last_name => '巣鴨',:first_name_kana => 'むつき' , :last_name_kana => 'すがも', :nickname => '白',  :password => '111111', :introduction => '教室', :admin => 'false' )
User.create(:email => 'h@h', :first_name => '広介', :last_name => '人見',:first_name_kana => 'こうすけ' , :last_name_kana => 'ひとみ', :nickname => '先生',  :password => '111111', :introduction => 'インターン', :admin => 'false' )
User.create(:email => 'e@e', :first_name => 'こより', :last_name => '上野',:first_name_kana => 'こより' , :last_name_kana => 'うえの', :nickname => 'コヨリ',  :password => '111111', :introduction => '弓道場', :admin => 'false' )
User.create(:email => 'g@g', :first_name => '颯介', :last_name => '福地',:first_name_kana => 'そうすけ' , :last_name_kana => 'ふくち', :nickname => 'そうちゃん',  :password => '111111', :introduction => '甥っ子', :admin => 'false' )