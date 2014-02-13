Role::ROLE_HASH.values.each do |role|
  Role.create(name: role)
end

['sachin', 'manish', 'admin', 'user', 'guest'].each do |name|                           ;
  u = User.create(email: "#{name}@example.com", password: 'password',
                  password_confirmation: 'password', username: name)
  u.confirm!
end

['sachin', 'manish'].each do |name|
  u = User.find_by_email("#{name}@example.com")
  u.user_role.destroy
  u.create_user_role(role_id: Role.super_admin_role.id)
end

['admin'].each do |name|
  u = User.find_by_email("#{name}@example.com")
  u.user_role.destroy
  u.create_user_role(role_id: Role.admin_role.id)
end

['user'].each do |name|
  u = User.find_by_email("#{name}@example.com")
  u.user_role.destroy
  u.create_user_role(role_id: Role.user_role.id)
end

['guest'].each do |name|
  u = User.find_by_email("#{name}@example.com")
  u.user_role.destroy
  u.create_user_role(role_id: Role.guest_role.id)
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

['Nature', 'Car', 'Art'].each do |name|
  Gallery.create(name: name)
end
