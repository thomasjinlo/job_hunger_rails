puts 'Deleting everything...'

Job.destroy_all
Lead.destroy_all
Company.destroy_all
Recommendation.destroy_all
User.destroy_all

MULTIPLIER = 2

puts 'Creating users...'

def create_user
  email = Faker::Internet.email
  User.create(email: email, password: 'password')
end

MULTIPLIER.times do
  create_user
end

User.create(email: 'test@test.com', password: 'password')

puts 'Creating companies...'

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

puts 'Creating leads and jobs...'

def create_company_recommendations(parent)
  Company::RECOMMENDATIONS.each do |action|
    Recommendation.create(recommendable_type: parent.class, recommendable_id: parent.id, completed: false, action: action, user_id: parent.user.id, start_date: DateTime.now + rand(1..3))
  end
end

puts 'Creating leads and jobs...'

Company.all.each do |company|
  2.times do
    create_lead(company.id)
  end
  create_job(company.id)
  create_company_recommendations(company)
end

puts 'Creating recommendations...'

def create_lead_recommendations(parent)
  Lead::RECOMMENDATIONS.each do |action|
    Recommendation.create(recommendable_type: parent.class, recommendable_id: parent.id, completed: false, action: action, user_id: parent.company.user.id, start_date: DateTime.now + rand(1..3))
  end
end

Lead.all.each do |lead|
  create_lead_recommendations(lead)
end

puts 'Done!'
