class GenerateBillsService

  def self.perform(customer)
    new(customer).perform
  end

  def initialize(customer)
    @customer = customer
  end

  attr_reader :customer

  def perform
    months = []

    (1..12).each do |i|
      due_date = i.month.from_now

      bills = BillService.generate_bills(customer, due_date)
      months << MonthBillService.generate_month_bills(bills, due_date)
    end

    YearBillService.generate_year_bill(months, customer)
  end

end
