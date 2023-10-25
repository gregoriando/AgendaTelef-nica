@lista = [{ nome: 'Greg', telefone: '19982445055' }]

def adicionar_contato
  puts 'Digite o nome do contato'
  nome = gets.chomp
  puts 'Digite o telefone do contato'
  telefone = gets.chomp.to_i
  @lista << { nome: nome, telefone: telefone }
end

def editar_contato
  mostrar_contato
  puts 'Digite o numero do contato que você deseja editar: '
  n_contato = gets.chomp.to_i
  puts "Tem certeza que deseja alterar esse contato? #{@lista[n_contato][:nome]}"
  puts 'Digite 1 para sim e 2 para não'
  confirmar = gets.chomp.to_i

  if confirmar == 1
    puts 'Digite o novo nome do contato: '
    @lista[n_contato][:nome] = gets.chomp
    puts 'Digite o novo número do contato: '
    @lista[n_contato][:telefone] = gets.chomp
    puts " O contato foi alterado com sucesso #{@lista[n_contato][:nome]}"
  else
    puts 'Você desistiu de alterar o contato'
  end
end

def editar
  print 'Qual nome deseja editar: '
  nome = gets.chomp

  @lista.each do |contato|
    next unless contato[:nome].downcase == (nome.downcase)

    print 'Nome para editar (Se quiser manter o mesmo nome , aperte enter)'
    nome_salvo  = contato[:nome]

    contato[:nome] = gets.chomp
    contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

    print 'Telefone para editar (Se quiser manter o mesmo nome , aperte enter)'
    telefone_salvo = contato[:telefone]
    contato[:telefone] = gets.chomp
    contato[:telefone] = contato[:nome].empty ? telefone_salvo : contato[:telefone]
  end
end

def remove
  print 'Digite o nome do contato que você deseja remover'
  nome = gets.chomp

  @lista.each do |contato|
    next unless contato[:nome].downcase == (nome.downcase)

    indice = @lista.index(contato)
    @lista.delete_at(indice)
    break
  end
end

def remover_contato
  mostrar_contato
  puts 'Digite o número do contato que você deseja apagar: '
  n_contato = gets.chomp.to_i
  puts "Tem certeza que deseja deletar esse contato? #{@lista[n_contato]}"
  puts 'Digite 1 para sim e 2 para não'
  confirmar = gets.chomp.to_i
  if confirmar == 1
    puts 'Você deletou o contato'
    @lista.delete_at(n_contato.to_i)
  else
    puts 'Você não deletou da lista'
  end
end

def mostrar_contato
  @lista.each_with_index do |el, index|
    puts "Contato #{index} Nome: #{el[:nome]} - Telefone: #{el[:telefone]}"
  end
end

loop do
  puts "1.Adicionar contato\n2.Editar contato\n3.Remover contato\n4.Mostrar contatos\n5.Sair\n"
  puts "Digite a opção desejada: \n"
  valor = gets.chomp.to_i

  if valor == 1
    adicionar_contato
  elsif valor == 2
    editar_contato
  elsif valor == 3
    remover_contato
  elsif valor == 4
    mostrar_contato
  elsif valor == 5
    puts 'Até a Próxima'
    break
  else
    puts 'entrada inválida'
  end
end
