class GenerateBillsService

  def self.perform(customer)
    new(customer).perform
  end

  def initialize(customer)
    @customer = customer
  end

  attr_accessor :customer

  def perform
    year_bill = generate_year_bill
    sum = calculate_month_amount
    generate_month_bill_and_bills(year_bill, sum)
  end

  private

  def generate_year_bill
    YearBill.create!(init_date: Date.today, end_date: 1.year.from_now, customer: customer)
  end

  def calculate_month_amount
    customer.customers_packages.sum(&:price) + customer.customers_additional_services.sum(&:price)
  end

  def generate_month_bill_and_bills(year_bill, sum)
    (1..12).each do |i|
      due_date = i.month.from_now
      month_bill = MonthBill.create!(total_sum: sum, due_date: due_date, year_bill: year_bill)

      generate_bills(month_bill)
    end
  end

  def generate_bills(month_bill)
    customer.customers_packages.each do |cp|
      amount = cp.price
      due_date = month_bill.due_date

      Bill.create!(customers_package: cp, amount: amount, month_bill: month_bill, due_date: due_date)
    end

    customer.customers_additional_services.each do |cas|
      amount = cas.price
      due_date = month_bill.due_date

      Bill.create!(customers_additional_service: cas, amount: amount, month_bill: month_bill, due_date: due_date)
    end
  end

end
