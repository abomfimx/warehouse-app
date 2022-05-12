require 'rails_helper'

describe 'Usuário vê detalhes do Fornecedor' do
  it 'a partir da tela inicial' do
    # Arrange
    Supplier.create!(corporate_name: 'XPTO S/A', brand_name: 'XPTO', 
                     registration_number: '18082693000174', full_address: 'Av Interlagos, 1000', city: 'São Paulo', state: 'SP', email: 'contato@xpto.com.br', phone: '11-555-5555')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'XPTO'

    # Assert
    expect(page).to have_content('Fornecedor XPTO')
    expect(page).to have_content('CNPJ: 18082693000174')
    expect(page).to have_content('Endereço: ')
    expect(page).to have_content('Av Interlagos, 1000 - São Paulo - SP')
    expect(page).to have_content('E-mail: contato@xpto.com.br')
    expect(page).to have_content('Telefone: 11-555-5555')
  end

  it 'e volta para a tela inicial' do
    # Arrange
    Supplier.create!(corporate_name: 'XPTO S/A', brand_name: 'XPTO', 
                    registration_number: '18082693000174', full_address: 'Av Interlagos, 1000', city: 'São Paulo', state: 'SP', email: 'contato@xpto.com.br', phone: '11-555-5555')

    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'XPTO'
    click_on 'Home'
    # Assert
    expect(current_path).to eq root_path
  end
end