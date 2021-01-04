namespace :dev do
  desc "Configura o ambiente de dev"
  task setup: :environment do
    puts "Cadastrando os TIPOS..."
    kinds = %w(amigo, comercial, conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "TIPOS cadastrados com sucesso"
    
    100.times do |i|
      puts "Cadastrando os CONTATOS..."
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "CONTATOS cadastrados com sucesso"

    puts "Cadastrando os TELEFONES..."
    
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end

    puts "TELEFONES cadastrados com sucesso"
  end
end
