require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando Razão Social está vazio' do
        # Arrange
        supplier = Supplier.new(corporate_name: '', brand_name: 'XPTO', 
                                registration_number: '1808269300017', full_address: 'Av Interlagos, 1000', city: 'São Paulo', state: 'SP', email: 'contato@xpto.com.br')
        # Act
        result = supplier.valid?

        # Assert
        expect(result).to eq false
      end

      it 'falso quando Nome Fantasia está vazio' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'XPTO S/A', brand_name: '',
                                registration_number: '1808269300017', full_address: 'Av Interlagos, 1000', city: 'São Paulo', state: 'SP', email: 'contato@xpto.com.br')
        # Act
        result = supplier.valid?

        # Assert
        expect(result).to eq false
      end

      it 'falso quando CNPJ está vazio' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'XPTO S/A', brand_name: 'XPTO',
                                registration_number: '9', full_address: 'Av Interlagos, 1000', 
                                city: 'São Paulo', state: 'SP', email: 'contato@xpto.com.br')
        # Act
        result = supplier.valid?

        # Assert
        expect(result).to eq false
      end
      
      it 'falso quando E-mail está vazio' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'XPTO S/A', brand_name: 'XPTO',
                                registration_number: '1808269300017', full_address: 'Av Interlagos, 1000', city: 'São Paulo', state: 'SP', email: '')
        # Act
        result = supplier.valid?

        # Assert
        expect(result).to eq false
      end
    end

    it 'falso quando CNPJ já está em uso' do
      # Arrange
      first_supplier = Supplier.create!(corporate_name: 'XPTO S/A', brand_name: 'XPTO',
                                        registration_number: '1808269300017', 
                                        full_address: 'Av Interlagos, 1000', city: 'São Paulo', 
                                        state: 'SP', email: 'contato@xpto.com.br')

      second_supplier = Supplier.new(corporate_name: 'ACME S/A', brand_name: 'ACME',
                                     registration_number: '1808269300017', 
                                     full_address: 'Av Brasil, 200', city: 'Recife', state: 'PE', 
                                     email: 'contato@acme.com.br')
      
    # Act
    result = second_supplier.valid?
    # Assert 
    expect(result).to eq false
    end

    it 'falso quando CNPJ diferente de 13 caracteres' do
      # Arrange
      supplier = Supplier.new(corporate_name: 'XPTO S/A', brand_name: 'XPTO',
                                  registration_number: '180826930001', 
                                  full_address: 'Av Interlagos, 1000', city: 'São Paulo', 
                                  state: 'SP', email: 'contato@xpto.com.br')
      # Act
      # Assert
      expect(supplier).to_not be_valid
      end

  end
end
