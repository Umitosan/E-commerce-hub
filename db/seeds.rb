
class Seed

  def self.begin
    seed = Seed.new
    seed.clean_db
    seed.generate_products
    seed.generate_users
  end

  def clean_db
    User.destroy_all
    Product.destroy_all
  end

  def generate_users
    testAdmin = User.create!(username: 'tadmin',
                           email: 'tadmin@gmail.com',
                           password: '1234567',
                           admin: true
    )

    testUser = User.create!(username: 'tuser1',
                           email: 'tuser1@gmail.com',
                           password: '1234567',
                           admin: false
    )
  end

  def generate_products
    20.times do |i|
      Product.create!(name: Faker::Lorem.word,
                      price: rand(10...100),
                      description: Faker::Lorem.sentence(5, false, 0).chop,
                      image_url: "https://tinyurl.com/yampnrh3"
                      )
    end
  end

end

Seed.begin
