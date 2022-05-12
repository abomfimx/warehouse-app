require 'rails_helper'

describe 'Usuario visita tela de Fornecedores' do
  it 'e vê header Lista de Fornecedores' do
    # Arrange 
    # Act
    visit(root_path)
    click_on 'Fornecedores'
    # Assert
    expect(page).to have_content('Lista de Fornecedores')
  end

  it 'e vẽ os fornecedores cadastrados' do
    # Arrange
    Supplier.create!(corporate_name: 'XPTO S/A', brand_name: 'XPTO', 
                                registration_number: '18082693000174', full_address: 'Av Interlagos, 1000', city: 'São Paulo', state: 'SP', email: 'contato@xpto.com.br')

    Supplier.create!(corporate_name: 'ACME S/A', brand_name: 'ACME',
                                   registration_number: '42298046000184', 
                                   full_address: 'Av Brasil, 200', city: 'Recife', state: 'PE', 
                                   email: 'contato@acme.com.br')
    # Act
    visit(root_path)
    click_on 'Fornecedores'

    # Assert
    expect(page).not_to have_content('Não existem fornecedores cadastrados')
    expect(page).to have_content('Razão Social: XPTO S/A')
    expect(page).to have_content('Nome Fantasia: XPTO')
    expect(page).to have_content('CNPJ 18082693000174')
    expect(page).to have_content('Endereço: Av Interlagos, 1000')
    expect(page).to have_content('Cidade: São Paulo')
    expect(page).to have_content('Estado: SP')
    expect(page).to have_content('E-mail: contato@xpto.com.br')

    expect(page).to have_content('Razão Social: ACME S/A')
    expect(page).to have_content('Nome Fantasia: ACME')
    expect(page).to have_content('CNPJ 42298046000184')
    expect(page).to have_content('Endereço: Av Brasil, 200')
    expect(page).to have_content('Cidade: Recife')
    expect(page).to have_content('Estado: PE')
    expect(page).to have_content('E-mail: contato@acme.com.br')
  end

  it 'e não existem fornecedores cadastrados' do
    # Arrange
    # Act
    visit(root_path)
    click_on 'Fornecedores'
    # Assert
    expect(page).to have_content('Não existem fornecedores cadastrados')
  end
end