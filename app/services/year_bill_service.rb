class YearBillService
  def self.generate_year_bill(month_bills, customer)
    new(month_bills, customer).generate_year_bill
  end

  def initialize(month_bills, customer)
    @month_bills = month_bills
    @customer = customer
  end

  attr_reader :month_bills, :customer

  def generate_year_bill
    sum = month_bills.sum(&:total_sum)
    init_date = Date.today
    end_date = 1.year.from_now

    YearBill.create!(total_sum: sum, init_date: init_date, end_date: end_date, customer: customer, month_bills: month_bills)
  end
end
