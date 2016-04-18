puts "Deleting everything..."

Job.destroy_all
Lead.destroy_all
Company.destroy_all
User.destroy_all

MULTIPLIER = 10

puts "Creating users..."

def create_user
  User.create(email: Faker::Internet.email, password: "password")
end

MULTIPLIER.times do
  create_user
end

User.create(email: 'test@test.com', password: "password")


puts "Creating companies..."

def create_company(user_id)
  Company.create(name: Faker::Company.name, user_id: user_id, notes: Faker::Company.catch_phrase, interest: rand(1..5), website: Faker::Internet.url)
end

User.all.each do |user|
  5.times do
    create_company(user.id)
  end
end




def create_lead(company_id)
  Lead.create(company_id: company_id, name: Faker::Name.name, blog: Faker::Internet.url, linked_in: Faker::Internet.url, notes: Faker::Company.catch_phrase)
end



def create_job(company_id)
  Job.create(title: Faker::Name.title, application_status: ['Interested', 'Applied', 'Rejected', 'Interview', 'Offer'].sample, url: Faker::Internet.url, company_id: company_id)
end


puts "Creating leads and jobs..."

Company.all.each do |company|
  2.times do
    create_lead(company.id)
  end
  create_job(company.id)
end



puts "Done!"