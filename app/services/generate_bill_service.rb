class GenerateBillService
  def self.perform(customer, due_date)
    new(customer, due_date).perform
  end

  def initialize(customer, due_date)
    @customer = customer
    @due_date = due_date
  end

  def perform
    bills = generate_bills_by_additional_service
    bills << generate_bills_by_package
  end

  private

  attr_reader :customer, :due_date

  def generate_bills_by_additional_service
    customer.customers_additional_services.map do |cas|
      Bill.create!(customers_additional_service: cas, price: cas.price, due_date_for: due_date)
    end
  end

  def generate_bills_by_package
    cp = customer.customers_package
    Bill.create!(customers_package: cp, price: cp.price, due_date_for: due_date)
  end
end
