class AutenticacaoPage < SitePrism::Page
	set_url 'login'

	element :txt_codigo_escola, '#schoolcode'
	element :txt_nome, '#username'
	element :txt_senha, '#password'
	element :btn_entrar, '#loginBtn'
	element :lbl_mensagem_erro, 'div[class="alert alert-danger"]'

	def codigoEscola(codigo_escola)
		txt_codigo_escola.set(codigo_escola)
	end

	def campoNomeUsuario(nome_usuario)
		txt_nome.set(nome_usuario)
	end

	def nomeSenha(senha_usuario)
		txt_senha.set(senha_usuario)
	end

	def botaoEntrar
		btn_entrar.click
	end

	def erroAutenticacao
		wait_for_lbl_mensagem_erro
		lbl_mensagem_erro
	end
end