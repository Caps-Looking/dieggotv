require 'cpf_cnpj'

class CustomerDecorator < ApplicationDecorator
  delegate_all

  def cpf_masked
    CPF.new(cpf).formatted
  end
end
