FactoryBot.define do
  factory :month_bill do
    total_sum { 355.0 }
    due_date_for { 1.month.from_now }
  end
end
