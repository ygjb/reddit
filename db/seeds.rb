rnd = Random.new
user = User.new(
      :email                 => 'xtymchenko@ex.ua',
      :password              => 'Andreylol99!',
      :password_confirmation => 'Andreylol99!'
)
user.skip_confirmation!
user.save!
20.times do
  pass = Faker::Internet.password(10, 20, true, true)
  user = User.new(
      :email                 => Faker::Internet.free_email,
      :password              => pass,
      :password_confirmation => pass
  )
  user.skip_confirmation!
  user.save!
  rnd.rand(10..100).times do
    link = Link.create!(
      :title => Faker::Lorem.sentence(3, true),
      :url  => Faker::Internet.url,
      :user => user
      )
  end
end
# count_link = Link.all.count
# count_user = User.all.count


# 100.times do |i|
#   Comment.create!(
#     :user => User.find_by(id: rnd.rand(1..count_user)),
#     :link => Link.find_by(id: i),
#     :body => Faker::Lorem.paragraph
#     )
# end