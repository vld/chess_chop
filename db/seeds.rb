# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
versions = Version.create([{name: "en"}, {name: "ru"}])

Admin.create(:email => "admin@chess-shop.com", :password => '123456', :password_confirmation => '123456')
Category.create(:name => "--", :version => versions.first)
Category.create(:name => "--", :version => versions.last)
