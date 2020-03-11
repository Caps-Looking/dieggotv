class GenerateBillsService

  def self.generate(customer)
    new(customer).generate
  end

  def initialize(customer)
    @customer = customer
    @customer_packages = CustomersPackage.where(customer_id: customer.id)
    @customer_additional_services = CustomersAdditionalService.where(customer_id: customer.id)
  end

  attr_accessor :customer, :customer_additional_services, :customer_packages

  def generate
    year_bill = generate_year_bill
    sum = calculate_month_amount
    generate_month_bill_and_bills(year_bill, sum)
  end

  private

  def generate_year_bill
    YearBill.create!(competence: 1.year.from_now, customer: customer)
  end

  def calculate_month_amount
    customer_packages.sum(&:price) + customer_additional_services.sum(&:price)
  end

  def generate_month_bill_and_bills(year_bill, sum)
    (1..12).each do |i|
      due_date = i.month.from_now
      month_bill = MonthBill.create!(total_sum: sum, due_date: due_date, year_bill: year_bill)

      generate_bills(month_bill)
    end
  end

  def generate_bills(month_bill)
    customer_packages.each do |cp|
      amount = cp.price
      due_date = month_bill.due_date

      Bill.create!(customers_package: cp, amount: amount, month_bill: month_bill, due_date: due_date)
    end

    customer_additional_services.each do |cas|
      amount = cas.price
      due_date = month_bill.due_date

      Bill.create!(customers_additional_service: cas, amount: amount, month_bill: month_bill, due_date: due_date)
    end
  end

end
