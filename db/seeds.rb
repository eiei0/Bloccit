require 'faker'
 
unique_post = 'This is a unique post'
unique_comment = 'This is a unique comment'

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
    user.skip_confirmation!
    user.save!
  end
  users = User.all

50.times do
   Post.create!(
     user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
   end
posts = Post.all

unless Post.where(title: unique_post).exists?
  Post.create!(title: unique_post, body: Faker::Lorem.paragraph)
end

Post.create(user: User.first, body: 'text here')


user = users.sample

user.posts.create_with(body: Faker::Lorem.paragraph).find_or_create_by(title: unique_post)

100.times do
 Comment.create!(
  # user: users.sample,   # we have not yet associated Users with Comments
   post: posts.sample,
   body: Faker::Lorem.paragraph
 )
end

unless Comment.where(body: unique_comment).exists?
  Comment.create!(body: unique_comment, post: posts.sample)
end

admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 member.skip_confirmation!
 member.save!
  

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"