# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{email: 'dummyuser@gmail.com', username: 'dummyuser', password: '12345678', password_confirmation: '12345678'}, {email: 'testuser@gmail.com', username: 'testuser', password: '12345678', password_confirmation: '12345678'}, {email: 'test@gmail.com', username: 'test', password: '12345678', password_confirmation: '12345678'}])

Contact.create([{first_name: 'Rohan', last_name: 'Gupta', mobile_number: '9465878454', user_id: 3}, {first_name: 'Khushi', last_name: 'Kapoor', mobile_number: '9129514564', user_id: 3}, {first_name: 'Aniket', last_name: 'Katkar', mobile_number: '7656136454', user_id: 3}, {first_name: 'Ankit', last_name: 'Tiwari', mobile_number: '8976564124', user_id: 3}, {first_name: 'Shreyas', last_name: 'Dharav', mobile_number: '9745611511', user_id: 3}, {first_name: 'Amit', last_name: 'Jain', mobile_number: '7660156454', user_id: 3}, {first_name: 'Sayali', last_name: 'Patil', mobile_number: '8656511455', user_id: 3}, {first_name: 'Sagar', last_name: 'Betkar', mobile_number: '7666142451', user_id: 3}, {first_name: 'Sagar', last_name: 'Jadhav', mobile_number: '9416565454', user_id: 3}, {first_name: 'Swapnil', last_name: 'Jain', mobile_number: '8645632345', user_id: 3}, {first_name: 'Monica', last_name: 'Patel', mobile_number: '7899646551', user_id: 3}])

puts "----Contacts Created-----"
