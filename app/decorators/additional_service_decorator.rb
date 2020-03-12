class AdditionalServiceDecorator < ApplicationDecorator
  delegate_all

  def description
    "#{name} - $#{price}"
  end
end
