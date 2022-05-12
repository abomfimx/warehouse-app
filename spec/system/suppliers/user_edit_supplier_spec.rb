require 'rails_helper'

describe 'Usuário editando um Fornecedor' do
  it 'a partir da página de detalhes' do
    # Arrange
    Supplier.create!(corporate_name: 'XPTO S/A', brand_name: 'XPTO', 
                    registration_number: '18082693000174', full_address: 'Av Interlagos, 1000', city: 'São Paulo', state: 'SP', email: 'contato@xpto.com.br', phone: '11-555-5555')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'XPTO'
    click_on 'Editar'
    # Assert
    expect(page).to have_content 'Editar Fornecedor'
    expect(page).to have_field('Razão Social', with: 'XPTO S/A')
    expect(page).to have_field('Nome Fantasia', with: 'XPTO')
    expect(page).to have_field('CNPJ', with: '18082693000174')
    expect(page).to have_field('Endereço', with: 'Av Interlagos, 1000')
    expect(page).to have_field('Cidade', with: 'São Paulo')
    expect(page).to have_field('Estado', with: 'SP')
    expect(page).to have_field('E-mail', with: 'contato@xpto.com.br')
    expect(page).to have_field('Telefone', with: '11-555-5555')
  end

  it 'com sucesso' do
    # Arrange
    Supplier.create!(corporate_name: 'XPTO S/A', brand_name: 'XPTO', 
      registration_number: '18082693000174', full_address: 'Av Interlagos, 1000', city: 'São Paulo', state: 'SP', email: 'contato@xpto.com.br', phone: '11-555-5555')

    # Act 
    visit root_path
    click_on 'Fornecedores'
    click_on 'XPTO'
    click_on 'Editar'
    fill_in 'Razão Social', with: 'XPTO S/A'
    fill_in 'Nome Fantasia', with: 'XPTO'
    fill_in 'CNPJ', with: '18082693000174'
    fill_in 'Endereço', with: 'Av Interlagos, 100'
    fill_in 'Cidade', with: 'São Paulo'
    fill_in 'Estado', with: 'SP'
    fill_in 'E-mail', with: 'contato@xpto.com.br'
    fill_in 'Telefone', with: '11-555-5555'
    click_on 'Atualizar Fornecedor'
  end

  it 'e mantém os campos obrigatórios' do
    # Arrange
    Supplier.create!(corporate_name: 'XPTO S/A', brand_name: 'XPTO', 
      registration_number: '18082693000174', full_address: 'Av Interlagos, 1000', city: 'São Paulo', state: 'SP', email: 'contato@xpto.com.br', phone: '11-555-5555')

    # Act 
    visit root_path
    click_on 'Fornecedores'
    click_on 'XPTO'
    click_on 'Editar'
    fill_in 'Razão Social', with: ''
    fill_in 'Nome Fantasia', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'E-mail', with: 'contato@xpto.com.br'
    click_on 'Atualizar Fornecedor'

    # Assert
    expect(page).to have_content 'Não foi possível atualizar o fornecedor'
  end
end
