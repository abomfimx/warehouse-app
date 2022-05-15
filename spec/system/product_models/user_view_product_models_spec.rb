require 'rails_helper'

describe 'Usuário vẽ Modelos de ProdutoS' do
  it 'a partir do menu' do
    # Arrange

    # Act
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end
    # assert
    expect(current_path).to eq product_models_path
  end

  it 'com sucesso' do
    # Arrange
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                                registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                                city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                                phone: '11-555-5555')

    ProductModel.create!(name: 'J11', weight: 300, width: 10, height: 18, 
                        depth: 1, sku: 'CEL-J11CEL-XYZ749999', supplier: supplier)
    ProductModel.create!(name: 'TV-45', weight: 9000, width: 120, height: 45, 
                        depth: 5, sku: 'TV45-SAMSTV45-XYZ749', supplier: supplier)
    # act
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end

    # Assert
    expect(page).to have_content('J11')
    expect(page).to have_content('CEL-J11CEL-XYZ749999')
    expect(page).to have_content('Samsung')
    expect(page).to have_content('TV-45')
    expect(page).to have_content('TV45-SAMSTV45-XYZ749')
    expect(page).to have_content('Samsung')
  end

  it 'não existem modelo de produtos cadastrados' do
    # Arrange
    # Act
    visit root_path
    click_on 'Modelos de Produtos'
    # Assert
    expect(page).to have_content 'Nenhum modelo de produto cadastrado'
  end
end