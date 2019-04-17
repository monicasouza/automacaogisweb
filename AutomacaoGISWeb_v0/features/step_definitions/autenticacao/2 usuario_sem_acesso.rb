Quando(/^preencho com dados invalidos os campos "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |codigo_escola,usuario,senha|
  	autenticacao.codigoEscola(codigo_escola)
    autenticacao.campoNomeUsuario(usuario)
    autenticacao.nomeSenha(senha)
    autenticacao.botaoEntrar
end


Então(/^uma mensagem de alerta irá ser apresentada na tela$/) do
   	expect(autenticacao.erroAutenticacao.text).to eql MASSA['mensagem']['erro_login']
end