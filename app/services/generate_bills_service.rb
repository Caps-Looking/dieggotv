class GenerateBillsService

  def self.perform(customer)
    new(customer).perform
  end

  def initialize(customer)
    @customer = customer
  end

  attr_reader :customer

  def perform
    year_bill = generate_year_bill
    MonthBillService.generate_month_bills(customer, year_bill)
  end

  private

  def generate_year_bill
    YearBill.create!(init_date: Date.today, end_date: 1.year.from_now, customer: customer)
  end

end
