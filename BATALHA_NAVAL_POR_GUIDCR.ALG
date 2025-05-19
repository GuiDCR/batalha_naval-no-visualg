Algoritmo "batalha_naval"
//Aluno: Guilherme de Castro Ramos
//Disciplina: Construção de Algorítmos
//Professor: Eugênio
arquivo "entrada.txt"

Const
TAM = 10

Tipo
Tcelula = registro
   navio: inteiro
   mark: caractere
Fimregistro
Var
tabP1: vetor[1..TAM,1..TAM] de Tcelula
tabP2: vetor[1..TAM,1..TAM] de Tcelula
tabM: vetor[1..TAM,1..TAM] de Tcelula
verificador,P1,P2:logico
pts_P1,pts_p2,i,j:inteiro
j1,j2,vez:caractere

procedimento LeituraDemo
//Procedimento usando apenas nos testes para conferir a posição dos navios
inicio
  para i de 1 ate TAM faca
    para j de 1 ate TAM faca
      escreva(tabP1[i,j].navio)
    fimpara
    escreval("")
  fimpara
  escreval("")
  para i de 1 ate TAM faca
    para j de 1 ate TAM faca
      escreva(tabP2[i,j].navio)
    fimpara
    escreval("")
  fimpara
fimprocedimento

Funcao inserirP1:logico
Var
A,B,C,D,F:logico
Inicio
A<-PosicionarNavioP1(5)//Posiciona o navio de que ocupa 5 células
B<-PosicionarNavioP1(4)//Posiciona o navio de que ocupa 4 células
C<-PosicionarNavioP1(3)//Posiciona o navio de que ocupa 3 células
D<-PosicionarNavioP1(3)//Posiciona o navio de que ocupa 3 células
F<-PosicionarNavioP1(2)//Posiciona o navio de que ocupa 2 células
se((A e B e C e D e F) = verdadeiro)entao
  retorne verdadeiro
senao
  retorne falso
fimse
Fimfuncao

Funcao inserirP2:logico
Var
A,B,C,D,F:logico
Inicio
A<-PosicionarNavioP2(5) //Posiciona o navio de que ocupa 5 células
B<-PosicionarNavioP2(4) //Posiciona o navio de que ocupa 4 células
C<-PosicionarNavioP2(3) //Posiciona o navio de que ocupa 3 células
D<-PosicionarNavioP2(3) //Posiciona o navio de que ocupa 3 células
F<-PosicionarNavioP2(2) //Posiciona o navio de que ocupa 2 células

retorne (A e B e C e D e F)
Fimfuncao

Funcao PosicionarNavioP1(tamanho:inteiro):logico
Var
n:inteiro
eixo:caractere
Inicio
leia(i,j,eixo)
se (eixo = "h") ou (eixo = "H")entao
  para n de 0 ate tamanho-1 faca
     se(i <= TAM) e (j+n <= TAM)entao
        se(tabP1[i,j+n].navio <> 1)entao //Testa se a posição já foi ocupada
          tabP1[i,j+n].navio<- 1 //A posição onde há navios é marcada por 1
          retorne verdadeiro
        senao
          retorne falso
        fimse
     senao
       retorne falso
     fimse
  fimpara
senao
  se(eixo = "v") ou (eixo = "V")entao
    para n de 0 ate tamanho-1 faca
      se(j <= tam) e (i + n <= TAM)entao
        se (tabP1[i+n,j].navio <> 1)entao
          tabP1[i+n,j].navio<- 1
          retorne verdadeiro
        senao
          retorne falso
        fimse
      senao
        retorne falso
      fimse
    fimpara
  senao
    escreval("O EIXO SELECIONADO É INVALIDO")
    retorne falso
  fimse
fimse
Fimfuncao

Funcao PosicionarNavioP2(tamanho:inteiro):logico
Var
n:inteiro
eixo:caractere
Inicio
leia(i,j,eixo)
se (eixo = "h") ou (eixo = "H")entao
  para n de 0 ate tamanho-1 faca
     se(i <= TAM) e (j+n <= TAM)entao //Verifica se o navio não ultrapassa o tabuleiro
        se(tabP2[i,j+n].navio <> 1)entao //Verifica se a posição já foi ocupada
          tabP2[i,j+n].navio<- 1
          retorne verdadeiro
        senao
          retorne falso
        fimse
     senao
       retorne falso
     fimse
  fimpara
senao
  se(eixo = "v") ou (eixo = "V")entao
    para n de 0 ate tamanho-1 faca
      se(j <= tam) e (i + n <= TAM)entao
        se (tabP2[i+n,j].navio <> 1)entao
          tabP2[i+n,j].navio<- 1
          retorne verdadeiro
        senao
          retorne falso
        fimse
      senao
        retorne falso
      fimse
    fimpara
  senao
    escreval("O EIXO SELECIONADO É INVALIDO")
    retorne falso
  fimse
fimse
Fimfuncao

Funcao Verificar():logico
//Se qualquer posição no arquivo for inválida essa função sempre retornará falso
Inicio
P1<-inserirP1()
P2<-inserirP2()
retorne (P1 e P2)
Fimfuncao

//SE A LEITURA DO ARQUIVO ESTIVER CORRETA O JOGO SERÁ INICIALIZADO POR ESSE
//PROCEDIMENTO
procedimento iniciarJogo()
var
option:inteiro
inicio
escreval("============= BATALHA NAVAL NO VISUALG =============")
escreval("Selecione o modo de jogo:")
escreval("(1) - Humano1 x Humano2")
escreval("(2) - Humano x Máquina")
escreval("(3) - Sair")
escreval("============= Feito por Guilherme Ramos =============")
leia(option)
escolha(option)
  caso 1
    iniciarPVP()
    iniciarJogo()
  caso 2
    iniciarPVE()
    iniciarJogo()
  caso 3
    escreval("ENCERRANDO JOGO...")
  outrocaso
    escreval("Opção Inválida")
fimescolha
fimprocedimento

//Inicializa o modo Jogador x Jogador
Procedimento iniciarPVP
Inicio
limpatela
escreval(" VOCÊ SELECIONOU MODO JOGADOR X JOGADOR !")
escreval("Digite o nome do jogador 1")
leia(j1)
escreval("Digite o nome do jogador 2")
leia(j2)
escreval("")
escreval("====================INSTRUÇÕES==============================")
escreval("- O jogadores tem suas posições já escolhidas marcadas por O")
escreval("- As posições escolhidas onde havia um navio é marcada por X")
escreval("============================================================")
escreval("Tabuleiro de ",j1)
para i de 1 ate TAM faca
  para j de 1 ate TAM faca
     tabP1[i,j].mark<- " ."
     escreva(tabP1[i,j].mark)
  fimpara
  escreval("")
fimpara
escreval("")
escreval("Tabuleiro de ",j2)
para i de 1 ate TAM faca
  para j de 1 ate TAM faca
    tabP2[i,j].mark<- " ."
    escreva(tabP2[i,j].mark)
  fimpara
  escreval("")
fimpara

pts_p1<- 0
pts_p2<- 0
vez<-"P1"
//O LAÇO REPETE ATÉ QUE UM DOS JOGADORES DESCUBRA A POSIÇÃO DE TODOS OS NAVIOS
repita
  se(vez = "P1")entao
    atacarP2()
  senao
    atacarP1()
  fimse
  limpatela
  exibirTabuleiros()
ate(pts_p1 = 1700) ou (pts_p2=1700)

//AS LINHAS DE CÓDIGO ABAIXO MOSTRAM O RESULTADO DO JOGO
se(pts_p1 > pts_p2)entao
  escreval(j1,"GANHOU O JOGO!")
  escreval("======= PLACAR =======")
  escreval(j1," - ",pts_p1)
  escreval(j2," - ",pts_p2)
  escreval("======================")
senao
  escreval(j2,"GANHOU O JOGO!")
  escreval("======= PLACAR =======")
  escreval(j2," - ",pts_p2)
  escreval(j1," - ",pts_p1)
  escreval("======================")
fimse
Fimprocedimento

//Procedimento que é ativado no turno do jogador 2
Procedimento atacarP1
var
controle:caractere
inicio
controle<- "N"
escreval("É a vez do(a): ",j2)
enquanto (controle = "N")faca
   escreval("Digite a linha que deseja atacar")
   leia(i)
   escreval("Digite a coluna que deseja atacar")
   leia(j)
   se(i >= 1) e (i <= TAM) e (j >= 1) e (j <= TAM)entao
      se(tabP1[i,j].mark = " .")entao
         se(tabP1[i,j].navio = 1)entao
            tabP1[i,j].mark<- " X"
            controle<- "S"
            vez<- "P2"
            pts_p2<- pts_p2 + 100
         senao
            tabP1[i,j].mark<- " O"
            vez<- "P1"
            controle<- "S"
         fimse
      senao
         escreval("Esta posição já foi escolhida, tente de novo")
      fimse
   senao
      escreval("O nº da linha ou nº da coluna é inválido")
   fimse
fimenquanto
Fimprocedimento

//Procedimento que é ativado no turno do Jogador 1
Procedimento atacarP2
var
controle:caractere
inicio
escreval("É a vez do(a): ",j1)
controle<- "N"
enquanto (controle = "N") faca
   escreval("Digite a linha que deseja atacar")
   leia(i)
   escreval("Digite a coluna que deseja atacar")
   leia(j)
   se(i >= 1) e (i <= TAM) e (j >= 1) e (j <= TAM)entao
      se(tabP2[i,j].mark = " .")entao
         se(tabP2[i,j].navio = 1)entao
            tabP2[i,j].mark<- " X"
            controle<- "S"
            vez<- "P1"
            pts_p1<- pts_p1 + 100
         senao
            tabP2[i,j].mark<- " O"
            vez<- "P2"
            controle<- "S"
         fimse
      senao
         escreval("Esta posição já foi escolhida, tente de novo")
      fimse
   senao
      escreval("O nº da linha ou nº da coluna é inválido, tente de novo")
   fimse
fimenquanto
Fimprocedimento

//EXIBE O TABULEIRO APÓS UMA JOGADA NO MODO JXJ
Procedimento exibirTabuleiros
inicio
 escreval("====================INSTRUÇÕES==============================")
 escreval("- O jogadores tem suas posições já escolhidas marcadas por O")
 escreval("- As posições escolhidas onde havia um navio é marcada por X")
 escreval("============================================================")
 escreval("Tabuleiro de ",j1)
  para i de 1 ate TAM faca
      para j de 1 ate TAM faca
         escreva(tabP1[i,j].mark)
      fimpara
      escreval("")
  fimpara
  escreval("")
  escreval("Tabuleiro de ",j2)
  para i de 1 ate TAM faca
      para j de 1 ate TAM faca
         escreva(tabP2[i,j].mark)
      fimpara
  escreval("")
  fimpara
Fimprocedimento

Procedimento exibirTabuleiroPvE
inicio
limpatela
escreval("====================INSTRUÇÕES==============================")
escreval("- O jogadores tem suas posições já escolhidas marcadas por O")
escreval("- As posições escolhidas onde havia um navio é marcada por X")
escreval("============================================================")
escreval("Seu tabuleiro")
para i de 1 ate TAM faca
   para j de 1 ate TAM faca
      escreva(tabP1[i,j].mark)
   fimpara
   escreval("")
fimpara
escreval("")
escreval("Tabuleiro da Máquina")
para i de 1 ate TAM faca
   para j de 1 ate TAM faca
         escreva(tabM[i,j].mark)
   fimpara
   escreval("")
fimpara
Fimprocedimento

Procedimento iniciarPVE
var
controle:caractere
inicio
   limpatela
   posicionarAleatorio(5)
   posicionarAleatorio(4)
   posicionarAleatorio(3)
   posicionarAleatorio(3)
   posicionarAleatorio(2)
   para i de 1 ate tam faca
     para j de 1 ate tam faca
       escreva(tabM[i,j].navio)
     fimpara
     escreval("")
   fimpara
   limpatela
   escreval(" VOCÊ SELECIONOU MODO HUMANO X MÁQUINA !")
   escreval("")
   para i de 1 ate TAM faca
     para j de 1 ate TAM faca
        tabP1[i,j].mark<- " ."
     fimpara
     escreval("")
   fimpara
   para i de 1 ate TAM faca
     para j de 1 ate TAM faca
       tabM[i,j].mark<- " ."
     fimpara
     escreval("")
   fimpara
   exibirTabuleiroPvE()
   pts_p1<- 0
   pts_p2<- 0
   vez<-"P1"
   //O LAÇO REPETE ATÉ QUE UM DOS JOGADORES DESCUBRA A POSIÇÃO DE TODOS OS NAVIOS
   repita
     se(vez = "P1")entao
     //AS LINHAS ABAIXO DIRECIONAM O ATAQUE DO JOGADOR HUMANO
       atacarMaquina()
     senao
     //O PROCEDIMENTO ABAIXO DIRECIONA O ATAQUE DA MÁQUINA
       atacarHumano()
     fimse
     exibirTabuleiroPvE()
   ate(pts_p1 = 1700) ou (pts_p2 =1700)
   se(pts_p1 > pts_p2)entao
      escreval("VOCÊ GANHOU O JOGO!")
      escreval("======= PLACAR =======")
      escreval("Você - ",pts_p1)
      escreval("Máquina - ",pts_p2)
      escreval("======================")
   senao
      escreval("A MÁQUINA GANHOU O JOGO!")
      escreval("======= PLACAR =======")
      escreval("Máquina - ",pts_p2)
      escreval("Você - ",pts_p1)
      escreval("======================")
   fimse
Fimprocedimento

Procedimento posicionarAleatorio(tamanho:inteiro)
Var
n:inteiro
eixo:inteiro
check:logico

Inicio
   check<- falso
   enquanto (check = falso) faca //O laço repete até o valor aleatorio atenter
      aleatorio 0,1              //os requisitos
      leia(eixo)
      aleatorio off
      aleatorio 1,TAM - tamanho + 1
      leia(i)
      leia(j)
      aleatorio off

      se(eixo = 0)entao
         para n de 0 ate tamanho - 1 faca
            se (tabM[i,j+n].navio <> 1) e (j+n<= tam) entao
               check<- verdadeiro
            senao
               check<- falso
               interrompa
            fimse
         fimpara
      senao
         para n de 0 ate tamanho - 1 faca
            se (tabM[i+n,j].navio <> 1) e (i+n<= tam) entao
               check<- verdadeiro
            senao
               check<- falso
               interrompa
            fimse
         fimpara
      fimse
   fimenquanto
   //Quando valores validos forem encontrados a posição dos navios será marcado
   para n de 0 ate tamanho - 1 faca
    se(eixo = 0)entao
      tabM[i,j+n].navio<- 1
    senao
      tabM[i+n,j].navio<- 1
    fimse
   fimpara
Fimprocedimento

Procedimento atacarHumano
var
controle:caractere
inicio
controle<- "S"
enquanto (controle = "S") faca
   aleatorio 1,10
   leia(i)
   leia(j)
   aleatorio off
   se(tabP1[i,j].mark = " .")entao
      se(tabP1[i,j].navio = 1)entao
         tabP1[i,j].mark<- " X"
         controle<- "S"
         vez<- "P2"
         pts_p2<- pts_p2 + 100
      senao
         tabP1[i,j].mark<- " O"
         vez<- "P1"
         controle<- "N"
      fimse
   senao
      controle<- "S"
   fimse
fimenquanto
Fimprocedimento

Procedimento atacarMaquina
var
controle:caractere
inicio
escreval("É a sua vez")
controle<- "N"
enquanto (controle = "N") faca
   escreval("Digite a linha que deseja atacar")
   leia(i)
   escreval("Digite a coluna que deseja atacar")
   leia(j)
   se(i >= 1) e (i <= TAM) e (j >= 1) e (j <= TAM)entao
      se(tabM[i,j].mark = " .")entao
         se(tabM[i,j].navio = 1)entao
            tabM[i,j].mark<- " X"
            controle<- "S"
            vez<- "P1"
            pts_p1<- pts_p1 + 100
         senao
            tabM[i,j].mark<- " O"
            vez<- "P2"
            controle<- "S"
         fimse
      senao
         escreval("Esta posição já foi escolhida, tente de novo")
      fimse
   senao
      escreval("O nº da linha ou nº da coluna é inválido, tente de novo")
   fimse
fimenquanto
Fimprocedimento

//ESCOPO GLOBAL
Inicio
//O CÓDIGO ACABOU FICANDO MUITO GRANDE E UM POUCO BAGUNÇADO POR CAUSA DAS
//LIMITAÇÕES DO VISUALG, PRINCIPALMENTE POR NÃO CONSEGUIR COLOCAR VETORES
//COMO PARÂMETRO DE FUNÇÕES

verificador<-Verificar()
// Verifica se as posições inseridas pelo arquivo são válidas
se (verificador = verdadeiro)entao
  leituraDemo()// Esse procedimento é a apenas um teste para ver a posição dos navios
  limpatela
  iniciarJogo()
senao
  leituraDemo()
  escreval("NÃO FOI POSSÍVEL INICIAR O JOGO, ALTERE AS POSIÇÕES NO ARQUIVO")
  escreval("E TENTE NOVAMENTE")
  escreval("")
  escreval("INSTRUÇÕES")
  escreval("- A ordem da leitura são dos navios de 5,4,3,3,2 respectivamente")
  escreval("- E a leitura da posição de cada navio é na ordem: linha, coluna, eixo")
  escreval("- A leitura das posições do navio na horizontal é da esquerda para direita")
  escreval("- A leitura das posições do navio na vertical é de cima para baixo")
fimse
Fimalgoritmo


