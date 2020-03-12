class MonthBillService

  def self.generate_month_bills(bills, due_date)
    new(bills, due_date).generate_month_bills
  end

  def initialize(bills, due_date)
    @bills = bills
    @due_date = due_date
  end

  attr_reader :bills, :due_date

  def generate_month_bills
    sum = bills.map(&:amount).sum

    MonthBill.create!(total_sum: sum, due_date: due_date, bills: bills)
  end

end
