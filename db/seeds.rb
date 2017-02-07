20.times do
  pass = Faker::Internet.password(10, 20, true, true)
  user = User.new(
      :email                 => Faker::Internet.free_email,
      :password              => pass,
      :password_confirmation => pass
  )
  user.skip_confirmation!
  user.save!
  rnd = Random.new
  rnd.rand(10..100).times do
    Link.create!(
      :title => Faker::Lorem.sentence(3, true),
      :url  => Faker::Internet.url,
      :user => user
      )
  end
end