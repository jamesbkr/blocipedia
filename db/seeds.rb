# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

admin = User.create!(
    name: 'Admin User',
    email: 'admin@example.com',
    password: 'froddofroddo',
    role: 'admin')
    
    member = User.create!(
        name: 'Member User',
        email: 'member@example.com',
        password: 'froddofroddo',
        role: 'member')
        
        
    premium = User.create!(
        name: 'premium User',
        email: 'premium@example.com',
        password: 'froddofroddo',
        role: 'premium')
     users = User.all   
        
        50.times do 
            wiki = Wiki.create!(
                user: users.sample,
                title: Faker::Lorem.sentence,
                body: Faker::Lorem.paragraph,
                private: false)
                
            end
        