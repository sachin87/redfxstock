# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['super_admin', 'admin', 'user', 'guest'].each do |role|
  Role.create(name: role)
end

['sachin', 'manish', 'admin', 'user', 'guest'].each do |name|
  u = User.create(email: "#{name}@example.com", password: 'foobar', password_confirmation: 'foobar')
  u.confirm!
end

['sachin', 'manish'].each do |name|
  u = User.find_by_email("#{name}@example.com")
  u.role_id = Role.find_by_name('super_admin').id
  u.save
end

['admin'].each do |name|
  u = User.find_by_email("#{name}@example.com")
  u.role_id = Role.find_by_name('admin').id
  u.save
end

['user'].each do |name|
  u = User.find_by_email("#{name}@example.com")
  u.role_id = Role.find_by_name('user').id
  u.save
end

['guest'].each do |name|
  u = User.find_by_email("#{name}@example.com")
  u.role_id = Role.find_by_name('guest').id
  u.save
end

['Abstract', 'Animals/Wildlife', 'The Arts', 'Backgrounds/Textures', 'Beauty/Fashion', 'Buildings/Landmarks',
 'Business/Finance', 'Celebrities', 'Editorial', 'Education', 'Food and Drink', 'Healthcare/Medical',
 'Holidays', 'Illustrations/Clip-Art', 'Industrial', 'Interiors', 'Miscellaneous', 'Model Released Only',
 'Nature', 'Objects', 'Parks/Outdoor', 'People', 'Religion', 'Science', 'Signs/Symbols', 'Sports/Recreation',
 'Technology', 'Transportation', 'Vectors', 'Vintage'].each do |name|
  Category.create(name: name)
end

['Photography', 'Graphic Designer', 'Web Designer-Developer', 'Student', 'Artist', 'Other'].each do |expertise|
  Expertise.create(name: expertise)
end
