require 'rails_helper'

describe 'Usuário cadastra um Modelo de Produto' do
  it 'a partir da tela inicial' do
    # Arrange
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar Novo'
    
    # Assert
    expect(page).to have_content('Cadastrar Novo Modelo de Produto')
    expect(page).to have_field('Nome')
    expect(page).to have_field('Peso')
    expect(page).to have_field('Largura')
    expect(page).to have_field('Altura')
    expect(page).to have_field('Profundidade')
    expect(page).to have_field('Código SKU')
    expect(page).to have_field('Fornecedor')
  end

  it 'com sucesso' do
    # Arrangge
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                               registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                               city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                               phone: '11-555-5555')

    supplier_b = Supplier.create!(brand_name: 'Apple', corporate_name: 'Apple  Inc',
                                registration_number: '10040323000139', full_address: 'Rua Stella 1200', 
                                city: 'São Paulo', state: 'SP', email: 'contato@apple.com.br', 
                                phone: '11-441-1441')

    product_model = ProductModel.new(name: 'Celular J11', weight: 300, width: 10, height: 18, 
                                     depth: 1, sku: 'CEL-J11CEL-XYZ749999', supplier: supplier)

    # Act
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar Novo' 
    fill_in 'Nome', with: 'Celular J11'
    fill_in 'Peso', with: 300
    fill_in 'Largura', with: 10
    fill_in 'Altura', with: 18
    fill_in 'Profundidade', with: 1
    fill_in 'Código SKU', with: 'CEL-J11CEL-XYZ749999'
    select 'Apple', from: 'Fornecedor'
    click_on 'Salvar'

    # Assert
    expect(page).to have_content 'Modelo de produto cadastrado com sucesso'
    expect(page).to have_content 'Celular J11'
    expect(page).to have_content 'Fornecedor: Apple'
    expect(page).to have_content 'Peso: 300g'
    expect(page).to have_content 'Dimensão: 10cm x 18cm x 1cm'
    expect(page).to have_content 'Código SKU: CEL-J11CEL-XYZ749999'  
  end

  it 'com dados incompletos' do
    # Arrangge
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung  Inc',
                               registration_number: '30540323000139', full_address: 'Av Brasil 200', 
                               city: 'São Paulo', state: 'SP', email: 'contato@samsung.com.br', 
                               phone: '11-555-5555')
                               
    supplier_b = Supplier.create!(brand_name: 'Apple', corporate_name: 'Apple  Inc',
                                  registration_number: '10040323000139', full_address: 'Rua Stella 1200', 
                                  city: 'São Paulo', state: 'SP', email: 'contato@apple.com.br', 
                                  phone: '11-441-1441')

    product_model = ProductModel.new(name: 'Celular J11', weight: '', width: 10, height: 18, 
                                     depth: 1, sku: 'CEL-J11CEL-XYZ749999', supplier: supplier)

    # Act
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar Novo' 
    fill_in 'Nome', with: 'Celular J11'
    fill_in 'Peso', with: ''
    fill_in 'Largura', with: 10
    fill_in 'Altura', with: 18
    fill_in 'Profundidade', with: 1
    fill_in 'Código SKU', with: 'CEL-J11CEL-XYZ749999'
    select 'Samsung', from: 'Fornecedor'
    click_on 'Salvar'

    # Assert
    expect(page).to have_content 'Modelo de Produto não cadastrado'
    expect(page).to have_content 'Peso não pode ficar em branco'
 
  end
end