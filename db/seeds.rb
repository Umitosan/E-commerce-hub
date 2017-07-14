class Seed

  def self.begin
    seed = Seed.new
    seed.generate_products
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
