Dado(/^que eu acessei o sistema$/) do

end

Quando(/^preencho "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |codigo_escola,usuario,senha|
  	autenticacao.codigoEscola(codigo_escola)
    autenticacao.campoNomeUsuario(usuario)
    autenticacao.nomeSenha(senha)
    autenticacao.botaoEntrar
end


Então(/^a página inicial do sistema é carregada com "([^"]*)" e "([^"]*)" validados$/) do |nome, escola|
	expect(main.campoReflexao)
   	expect(main.header.text).to eql escola
   	main.clicarImagemUsuario
   	expect(main.nomeUsuario.text).to eql nome
end