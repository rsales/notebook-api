namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Resetando o banco de dados..."
    
    %x(rails db:drop db:create db:migrate)

    puts "Cadastrando os tipos de contatos..."

    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos de contatos cadastrados com sucesso!"

    #############################################
    
    puts "Cadastrando os contatos..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.days.ago, to: 18.days.ago),
        kind: Kind.all.sample
      )
    end

    puts "Contatos cadastrados com sucesso!"

    #############################################
    
    puts "Cadastrando os telefones..."

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        # phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        # contact.phones << phone
        # contact.save!
        contact.phones.create!(
          number: Faker::PhoneNumber.cell_phone
        )
      end 
    end

    puts "Telefones cadastrados com sucesso!"

    #############################################
    
    puts "Cadastrando os endereços..."

    Contact.all.each do |contact|
      Address.create(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts "Endereços cadastrados com sucesso!"
  end

end
