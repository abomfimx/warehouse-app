require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando Nome está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: '', code: 'RIO', address:'Av. Atlantica, 1200',
                                  cep: '25000-000', city: 'Rio', area: 40000,
                                  description: 'Galpão do aeroporto do Rio')
                                
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'falso quando Código está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: '', address:'Av. Atlantica, 1200',
                                  cep: '25000-000', city: 'Rio', area: 40000,
                                  description: 'Galpão do aeroporto do Rio')
                                
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'falso quando Endereço está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: '' ,
                                  cep: '25000-000', city: 'Rio', area: 40000,
                                  description: 'Galpão do aeroporto do Rio')
                                
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'falso quando CEP está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Av. Atlantica, 1200' ,
                                  cep: '', city: 'Rio', area: 40000,
                                  description: 'Galpão do aeroporto do Rio')
                                
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'falso quando Cidade está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Av. Atlantica, 1200' ,
                                  cep: '25000-000', city: '', area: 40000,
                                  description: 'Galpão do aeroporto do Rio')
                                
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'falso quando Área está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Av. Atlantica, 1200' ,
                                  cep: '25000-000', city: 'Rio', area: '',
                                  description: 'Galpão do aeroporto do Rio')
                                
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'falso quando Descrição está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Av. Atlantica, 1200' ,
                                  cep: '25000-000', city: 'Rio', area: '40000',
                                  description: '')
                                
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

    end

    it 'falso quando Código já está em uso' do
      # Arrangge
      first_warehouse = Warehouse.create(name: 'Brasília', code: 'BRA',address:'Endereço', 
                                      cep: '95000-000', city: 'Brasilia', area: 1000,
                                      description: 'Alguma coisa')
                                    
      second_warehouse = Warehouse.new(name: 'Niteroi', code: 'BRA',address:'Avenida', 
                                        cep: '35000-000', city: 'Niteroi', area: 1500,
                                        description: 'Outra coisa')

      # Act
      result = second_warehouse.valid?
      # Assert
      expect(result).to eq false

    end

    it 'falso quando Nome já está em uso' do
      # Arrangge
      first_warehouse = Warehouse.create(name: 'Recife', code: 'REF',address:'Endereço', 
                                      cep: '25000-000', city: 'Recife', area: 1000,
                                      description: 'Alguma coisa')
                                    
      second_warehouse = Warehouse.new(name: 'Recife', code: 'REE',address:'Avenida', 
                                        cep: '35000-000', city: 'Recife', area: 1500,
                                        description: 'Outra coisa')

      # Act
      result = second_warehouse.valid?
      # Assert
      expect(result).to eq false

    end

    it 'falso quando Código diferente de 3 caracteres' do
      # Arrange

      warehouse = Warehouse.new(name: 'Rio', code: 'RIIO', address:'Av. Atlantica, 1200',
                                cep: '00000-000', city: 'Rio', area: 40000,
                                description: 'Galpão do aeroporto do Rio')

      # Act
      code_size = warehouse.code.size
      result = code_size == 3

      # Act
      expect(result).to eq false
    end

    it 'falso quando formato do CEP incorreto' do
      # Arrange
      warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address:'Av. Atlantica, 1200',
                                cep: '00000-00', city: 'Rio', area: 40000,
                                description: 'Galpão do aeroporto do Rio')

      # Act
      result = warehouse.valid?

      # Act
      expect(result).to eq false
    end

  end
end
