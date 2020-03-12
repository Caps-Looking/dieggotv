class GenerateMonthBillService
  def self.perform(bills, due_date)
    new(bills, due_date).perform
  end

  def initialize(bills, due_date)
    @bills = bills
    @due_date = due_date
  end

  def perform
    MonthBill.create!(total_sum: price, due_date_for: due_date, bills: bills)
  end

  private

  attr_reader :bills, :due_date

  def price
    bills.map(&:price).sum
  end
end
