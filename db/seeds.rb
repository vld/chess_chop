# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
versions = Version.create([{name: "en"}, {name: "ru"}])

Category.create(:name => "--", :version => versions.first)
Category.create(:name => "--", :version => versions.last)

Category.create(:name => "Wooden", :version => versions.first)
Category.create(:name => "Glass", :version => versions.first)

Category.create(:name => "Деревянные", :version => versions.last)
Category.create(:name => "Стеклянные", :version => versions.last)

