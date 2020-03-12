class BillService
  def self.generate_bills(customer, month_bill)
    new(customer, month_bill).generate_bills
  end

  def initialize(customer, month_bill)
    @customer = customer
    @month_bill = month_bill
  end

  attr_reader :customer, :month_bill

  def generate_bills
    cp = customer.customers_package
    amount = cp.price
    due_date = month_bill.due_date

    Bill.create!(customers_package: cp, amount: amount, month_bill: month_bill, due_date: due_date)

    customer.customers_additional_services.each do |cas|
      amount = cas.price
      due_date = month_bill.due_date

      Bill.create!(customers_additional_service: cas, amount: amount, month_bill: month_bill, due_date: due_date)
    end
  end

end
