class MainPage < SitePrism::Page
	element :lbl_header, 'h1[class="c-header__school-name"]'
	#element :campo_reflexao, 'div[class="recursos grid-item gridRecursoResp"]'
	element :campo_reflexao, '.recursos.grid-item'
	element :img_usuario_imagem, 'img[alt="avatar"]'

	#Campo de imagem de usuario
	element :lbl_nome_usuario, 'div[class="c-userPopover__name"]'

    def header
    	wait_for_lbl_header
		lbl_header
	end

	def campoReflexao
		wait_for_campo_reflexao
		campo_reflexao
	end

	def clicarImagemUsuario
		img_usuario_imagem.click
	end

	def nomeUsuario
		wait_for_lbl_nome_usuario
		lbl_nome_usuario
	end
end