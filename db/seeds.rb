require 'faker'
 
unique_post = 'This is a unique post'

50.times do
 Post.create!(
   title:  Faker::Lorem.sentence,
   body:   Faker::Lorem.paragraph
 )
end
posts = Post.all

unless Post.where(title: unique_post).exists?
  Post.create!(title: unique_post, body: Faker::Lorem.paragraph)
end

Post.create_with(body: Faker::Lorem.paragraph).find_or_create_by(title: unique_post)

100.times do
 Comment.create!(
   post: posts.sample,
   body: Faker::Lorem.paragraph
 )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"