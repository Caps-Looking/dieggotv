class BillingService
  def self.perform(customer)
    new(customer).perform
  end

  def initialize(customer)
    @customer = customer
  end

  def perform
    GenerateYearBillService.perform(month_bills_with_bills, customer)
  end

  private

  attr_reader :customer

  def month_bills_with_bills
    (1..12).map do |i|
      GenerateMonthBillService.perform(bills_for(i), due_date_for(i))
    end
  end

  def bills_for(i)
    GenerateBillService.perform(customer, due_date_for(i))
  end

  def due_date_for(i)
    i.month.from_now
  end
end
