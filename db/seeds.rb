# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
return if Rails.env.test?

print "Seeding #{Rails.env} database"

User.create(email: 'me@danmdavies.com', password: Rails.application.credentials.seed_user_password)

Article.create!(name: 'Test Article', risk: Article.risks.keys.first)

Article.risks.keys.each do |risk|
  Article.create!(name: "Article with #{risk} risk", risk: risk)
end
