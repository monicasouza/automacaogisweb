#language:pt
#encode:utf-8

Funcionalidade: Autenticação de usuários na plataforma SE
	Para que se possa acessar o sistema de ensino
	Sendo um usuário autorizado 
	Possa acessar o sistema com o código da escola, usuário e senha previamente cadastrados no Admin.

	Contexto: Home
        Dado que eu acessei o sistema

	@autenticacao_positiva
    Esquema do Cenario: Usuario autenticado
		Quando preencho <codigo_escola>, <usuario> e <senha>
		Então a página inicial do sistema é carregada com <nome> e <escola> validados
		
	Exemplos:
    	|codigo_escola 	|usuario        |senha 			|nome				  	|escola		|
    	|"ftd.mvp"     	|"ftd_dir001"   |"ftd_dir001"	|"FTD Diretoria"	  	|"FTD MVP"	|
	    |"ftd.mvp"     	|"ftd_prof001"  |"ftd_prof001"	|"FTD Professor 001"  	|"FTD MVP"	|
	    |"ftd.mvp"     	|"ftd_aluno001" |"ftd_aluno001"	|"FTD Aluno 001"	  	|"FTD MVP"	|
	    |"ftd.mvp"     	|"ftd_coord001" |"ftd_coord001"	|"FTD Coordenador 001" 	|"FTD MVP"	|
	 |"ftd.mvp"     	|"ftd_resp001"  |"ftd_resp001"	|"FTD Responsável 001" 	|"FTD MVP"	|

	  @autenticacao_negativa
      Esquema do Cenário: Usuario Sem Acesso
          Quando preencho com dados invalidos os campos <codigo_escola>, <usuario> e <senha>
          Então uma mensagem de alerta irá ser apresentada na tela

	  Exemplos:
     	|codigo_escola	|usuario    |senha 		|
		|"ftd.mvp"	    |"Teste 2"	|"Teste"	|