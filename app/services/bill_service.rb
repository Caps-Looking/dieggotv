class BillService
  def self.generate_bills(customer, due_date)
    new(customer, due_date).generate_bills
  end

  def initialize(customer, due_date)
    @customer = customer
    @due_date = due_date
  end

  attr_reader :customer, :due_date

  def generate_bills
    bills = []

    bills << generate_bills_by_package
    bills << generate_bills_by_additional_service

    bills.flatten
  end

  private

  def generate_bills_by_package
    cp = customer.customers_package
    amount = cp.price

    Bill.create!(customers_package: cp, amount: amount, due_date: due_date)
  end

  def generate_bills_by_additional_service
    customer.customers_additional_services.map do |cas|
      amount = cas.price

      Bill.create!(customers_additional_service: cas, amount: amount, due_date: due_date)
    end
  end

end
