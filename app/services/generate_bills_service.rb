class GenerateBillsService

  def self.generate(customer)
    year_bill = generate_year_bill(customer)

    customer_packages = CustomersPackage.where(customer_id: customer.id)
    customer_additional_services = CustomersAdditionalService.where(customer_id: customer.id)

    generate_month_bill(customer_additional_services, customer_packages, year_bill)
  end

  private

  def self.generate_month_bill(customer_additional_services, customer_packages, year_bill)
    sum = calculate_month_amount(customer_additional_services, customer_packages)

    (1..12).each do |i|
      month_bill = MonthBill.new
      month_bill.total_sum = sum
      month_bill.due_date = i.month.from_now
      month_bill.year_bill = year_bill

      month_bill.save

      generate_bills(customer_additional_services, customer_packages, month_bill)
    end
  end

  def self.generate_bills(customer_additional_services, customer_packages, month_bill)
    customer_packages.each do |cp|
      bill = Bill.new
      bill.customers_package = cp
      bill.amount = cp.package.price
      bill.month_bill = month_bill
      bill.due_date = month_bill.due_date

      bill.save
    end

    customer_additional_services.each do |cas|
      bill = Bill.new
      bill.customers_additional_service = cas
      bill.amount = cas.additional_service.price
      bill.month_bill = month_bill
      bill.due_date = month_bill.due_date

      bill.save
    end
  end

  def self.calculate_month_amount(customer_additional_services, customer_packages)
    sum = 0
    customer_packages.each do |package|
      sum = sum + package.price
    end

    customer_additional_services.each do |as|
      sum = sum + as.price
    end

    sum
  end

  def self.generate_year_bill(customer)
    year_bill = YearBill.new
    year_bill.competence = 1.year.from_now
    year_bill.customer = customer

    year_bill.save

    year_bill
  end

end
