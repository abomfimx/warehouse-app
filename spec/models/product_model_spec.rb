require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do 
    context 'presence' do
      it 'falso quando Nome está vazio' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
          registration_number: '30540323000139', full_address: 'Av Brasil 200', 
          city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
          phone: '11-555-5555')

        product_model = ProductModel.new(name: '', weight: 300, width: 10, height: 18, 
                              depth: 1, sku: 'CEL-J11CEL-XYZ749999', supplier: supplier)
        # Act 
        # Assert
        expect(product_model).to_not be_valid
      end

      it 'falso quando Peso está vazio' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                    registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                    city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                    phone: '11-555-5555')
  
        product_model = ProductModel.new(name: 'Tv-45', weight: '', width: 10, height: 18, 
                                        depth: 1, sku: 'CEL-J11CEL-XYZ749999', supplier: supplier)
                # Act 
        # Assert
        expect(product_model).to_not be_valid
      end

      it 'falso quando Largura está vazio' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                    registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                    city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                    phone: '11-555-5555')
  
        product_model = ProductModel.new(name: 'Tv-45', weight: 8000, width: '', height: 18, 
                                        depth: 1, sku: 'CEL-J11CEL-XYZ749999', supplier: supplier)
        # Act 
        # Assert
        expect(product_model).to_not be_valid
      end

      it 'falso quando Altura está vazio' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                    registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                    city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                    phone: '11-555-5555')
  
        product_model = ProductModel.new(name: 'Tv-45', weight: 8000, width: 10, height: '', 
                                        depth: 1, sku: 'CEL-J11CEL-XYZ749999', supplier: supplier)
        # Act 
        # Assert
        expect(product_model).to_not be_valid
      end

      it 'falso quando Profundidade está vazio' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                    registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                    city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                    phone: '11-555-5555')
  
        product_model = ProductModel.new(name: 'Tv-45', weight: 8000, width: 10, height: 18, 
                                        depth: '', sku: 'CEL-J11CEL-XYZ749999', supplier: supplier)
        # Act 
        # Assert
        expect(product_model).to_not be_valid
      end

      it 'falso quando Código SKU está vazio' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                    registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                    city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                    phone: '11-555-5555')
  
        product_model = ProductModel.new(name: 'Tv-45', weight: 8000, width: 10, height: 18, 
                                        depth: 1, sku: '', supplier: supplier)
        # Act 
        # Assert
        expect(product_model).to_not be_valid
      end

      it 'falso quando Supplier está vazio' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                    registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                    city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                    phone: '11-555-5555')
  
        product_model = ProductModel.new(name: 'Tv-45', weight: 8000, width: 10, height: 18, 
                                        depth: 1, sku: 'CEL-J11CEL-XYZ749999')
        # Act 
        # Assert
        expect(product_model).to_not be_valid
      end
    end
      it 'falso quando o Código SKU já está em uso' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                  registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                  city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                  phone: '11-555-5555')

        first_pm = ProductModel.create!(name: 'J11', weight: 300, width: 10, height: 18, 
                                    depth: 1, sku: 'CEL-J11CEL-XYZ749999', supplier: supplier)
        second_pm = ProductModel.new(name: 'TV-45', weight: 9000, width: 120, height: 45, 
                                    depth: 5, sku: 'CEL-J11CEL-XYZ749999', supplier: supplier)
      
        # Act
        # result = second_pm.valid
        # Assert
        expect(second_pm).to_not be_valid
      end

      it 'falso quando o Código SKU for diferente de 20 cararcteres' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                    registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                    city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                    phone: '11-555-5555')

        first_pm = ProductModel.new(name: 'J11', weight: 300, width: 10, height: 18, 
                                    depth: 1, sku: 'CEL-J11CEL-XYZ7X_19', supplier: supplier)

        second_pm = ProductModel.new(name: 'TV-45', weight: 9000, width: 120, height: 45, 
                                    depth: 5, sku: 'TV_X-TV45P-XYZ7499_21', supplier: supplier)

        # Act
        # Assert
        expect(first_pm).to_not be_valid
        expect(second_pm).to_not be_valid
      end

      it 'falso quando Peso menor ou igual a zero' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                    registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                    city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                    phone: '11-555-5555')
  
        first_pm = ProductModel.new(name: 'Tv-45', weight: -1, width: 10, height: 18, 
                                     depth: 1, sku: 'CEL-J11CEL-XYZ749999')
        second_pm = ProductModel.new(name: 'TV-45', weight: 0, width: 120, height: 45, 
                                     depth: 5, sku: 'TV_X-TV45P-XYZ7499_21', supplier: supplier)
        # Act 
        # Assert
        expect(first_pm).to_not be_valid
        expect(second_pm).to_not be_valid
      end

      it 'falso quando Altura menor ou igual a zero' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                    registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                    city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                    phone: '11-555-5555')
  
        first_pm = ProductModel.new(name: 'CELJ21', weight: 200, width: 10, height: -18, 
                                     depth: 1, sku: 'CEL-J21CEL-XYZ7499909')
        second_pm = ProductModel.new(name: 'TV-32', weight: 5000, width: 70, height: 0, 
                                     depth: 5, sku: 'TV_X-TV32P-XYZ749921', supplier: supplier)
        # Act 
        # Assert
        expect(first_pm).to_not be_valid
        expect(second_pm).to_not be_valid
      end

      it 'falso quando Largura menor ou igual a zero' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                    registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                    city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                    phone: '11-555-5555')
  
        first_pm = ProductModel.new(name: 'CELJ21', weight: 200, width: -10, height: 18, 
                                     depth: 1, sku: 'CEL-J21CEL-XYZ7499909')
        second_pm = ProductModel.new(name: 'TV-32', weight: 5000, width: 0, height: 45, 
                                     depth: 5, sku: 'TV_X-TV32P-XYZ749921', supplier: supplier)
        # Act 
        # Assert
        expect(first_pm).to_not be_valid
        expect(second_pm).to_not be_valid
      end

      it 'falso quando Profundidade menor ou igual a zero' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                    registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                    city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                    phone: '11-555-5555')
  
        first_pm = ProductModel.new(name: 'CELJ21', weight: 200, width: 10, height:18, 
                                     depth: 0, sku: 'CEL-J21CEL-XYZ7499909')
        second_pm = ProductModel.new(name: 'TV-32', weight: 5000, width: 70, height: 45, 
                                     depth: -5, sku: 'TV_X-TV32P-XYZ749921', supplier: supplier)
        # Act 
        # Assert
        expect(first_pm).to_not be_valid
        expect(second_pm).to_not be_valid
      end
  end
end
