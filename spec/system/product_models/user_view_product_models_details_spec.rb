require 'rails_helper'

describe 'Usuário vê detalhes do Modelo de Produtos' do
  it 'a partir da tela inicial' do
    # Arrange
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
          registration_number: '30540323000139', full_address: 'Av Brasil 200',
          city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br',
          phone: '11-555-5555')

    # ProductModel.new(name: 'J11', weight: 300, width: 10, height: 18, depth: 1, sku: 'CEL-J11CEL-XYZ749999', supplier: supplier)

    product_model = ProductModel.create(name: 'Celular J12', weight: 300, width: 10, height: 18,
                                     depth: 1, sku: 'CEL-J11CEL-XYZ749923', supplier: supplier)

       # Act
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Celular J12'

    # Assert
    expect(page).to have_content('Celular J12')
    expect(page).to have_content('Fornecedor: Samsung')
    expect(page).to have_content('Peso: 300')
    expect(page).to have_content('Dimensão: 10cm x 18cm x 1cm')
    expect(page).to have_content('Código SKU: CEL-J11CEL-XYZ749923')
  end

  it 'e volta para a tela inicial' do
    # Arrange
    # Act
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Home'
    # Assert
    expect(current_path).to eq root_path
  end

end
