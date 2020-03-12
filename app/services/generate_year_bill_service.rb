class GenerateYearBillService
  def self.perform(month_bills, customer)
    new(month_bills, customer).perform
  end

  def initialize(month_bills, customer)
    @month_bills = month_bills
    @customer = customer
  end

  def perform
    YearBill.create!(
        total_sum: price,
        init_date: init_date,
        end_date: end_date,
        customer: customer,
        month_bills: month_bills
    )
  end

  private

  attr_reader :month_bills, :customer

  def end_date
    1.year.from_now
  end

  def init_date
    Date.current
  end

  def price
    month_bills.sum(&:total_sum)
  end
end
