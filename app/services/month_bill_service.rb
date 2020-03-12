class MonthBillService

  def self.generate_month_bills(customer, year_bill)
    new(customer, year_bill).generate_month_bills
  end

  def initialize(customer, year_bill)
    @customer = customer
    @year_bill = year_bill
  end

  attr_reader :customer, :year_bill

  def generate_month_bills
    sum = calculate_amount
    generate_month_bill_and_bills(sum)
  end

  private

  def calculate_amount
    customer.customers_package + customer.customers_additional_services.sum(&:price)
  end

  def generate_month_bill_and_bills(sum)
    (1..12).each do |i|
      due_date = i.month.from_now
      month_bill = MonthBill.create!(total_sum: sum, due_date: due_date, year_bill: year_bill)

      BillService.generate_bills(customer, month_bill)
    end
  end

end
