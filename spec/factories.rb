FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@test.com" }
	end

	factory :workspace do
		sequence(:name) { |n| "Workspace #{n}" }
		sequence(:description) { |n| "Test Description #{n}" }
	end

	factory :task do
		sequence(:title) { |n| "Task #{n}" }
	end
end