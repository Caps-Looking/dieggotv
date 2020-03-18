FactoryBot.define do
  factory :bill do
    due_date_for { 1.month.from_now }
  end
end

