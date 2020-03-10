class GenerateBillsService

  def self.generate_bills(customer)
    self.generate_package_bill(customer)

    customer.customers_additional_services each do |additional_service|
      self.generate_additional_service_bill(additional_service)
    end
  end

  private

  def generate_package_bill(customer)
    service_bill = ServiceBill.new
    service_bill.service = customer.package.name
    service_bill.amount = customer.package.price
    service_bill.service_type = ServiceBill.service_types[:package]

    service_bill.save
  end

  def generate_additional_service_bill(additional_service)
    service_bill = ServiceBill.new
    service_bill.service = additional_service.name
    service_bill.amount = additional_service.price
    service_bill.service_type = ServiceBill.service_types[:additional_service]

    service_bill.save
  end

end
