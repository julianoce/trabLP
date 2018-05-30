#lang racket
(require graph)

; A gente definiu 1 como alfa e 2 como beta.
;DEFINA SEU GRAFO NA LINHA ABAIXO em ; (aresta, vertice, vertice)
(define z (weighted-graph/directed '((2 a b) (1 a c))))
(printf "Escreva sua PDL aqui:\n")
(define k(read))
(printf"Sua pdl eh:~a\n" k)
;(define k (substring b 0 3))

;TESTANDO SE TEM O LOOP DE A PRA A COM A ARESTA DA ENTRADA
(define bool2(has-edge? z 'a 'a)) ;bool2 retorna verdadeiro se tiver aresta de a pra a
(define bool(= (edge-weight z 'a 'a) 1)) ;bool retorna verdadeiro se a aresta de a pra a for 1
;tem que teste: se bool 2 for verdade, testar bool
(printf "Esse resultado eh para Alfa* loop entre vertices A e A\n")
(if (string=? k "1*") (and bool bool2) #f) 

;TESTANDO SE TEM LOOP ENTRE A E B COM A ARESTA DA ENTRADA
(define bool3(has-edge? z 'a 'b)) ;bool3 retorna verdadeiro se tiver aresta de a pra b
(define bool4(has-edge? z 'b 'a)) ;bool4 retorna verdadeiro se tiver aresta de a pra b
(define bool5(= (edge-weight z 'a 'b) 1)) ;bool5 retorna verdadeiro se a aresta de a pra b for 1
(define bool6(= (edge-weight z 'b 'a) 1)) ;bool5 retorna verdadeiro se a aresta de b pra a for 1
(printf "Esse resultado eh para Alfa* loop entre vertices A e B\n")
(if (string=? k "1*") (and bool3 bool4 bool5 bool6) #f) 

;no final todos esses ifs vao ser variaveis pq so precisa de um loop pra dar certo, entao tem que fazer um or no final com todos os ifs

;MESMA COISA SO QUE PRA A ARESTA 2

;TESTANDO SE TEM O LOOP DE A PRA A COM A ARESTA DA ENTRADA
(define bool7(has-edge? z 'a 'a)) ;bool2 retorna verdadeiro se tiver aresta de a pra a
(define bool8(= (edge-weight z 'a 'a) 2)) ;bool retorna verdadeiro se a aresta de a pra a for 2
;tem que teste: se bool 2 for verdade, testar bool
(printf "Esse resultado eh para Beta* loop entre vertices A e A\n")
(if (string=? k "2*") (and bool7 bool8) #f) 

;TESTANDO SE TEM LOOP ENTRE A E B COM A ARESTA DA ENTRADA
(define bool9(has-edge? z 'a 'b)) ;bool3 retorna verdadeiro se tiver aresta de a pra b
(define bool10(has-edge? z 'b 'a)) ;bool4 retorna verdadeiro se tiver aresta de a pra b
(define bool11(= (edge-weight z 'a 'b) 2)) ;bool5 retorna verdadeiro se a aresta de a pra b for 2
(define bool12(= (edge-weight z 'b 'a) 2)) ;bool5 retorna verdadeiro se a aresta de b pra a for 2
(printf "Esse resultado eh para Beta* loop entre vertices A e B\n")
(if (string=? k "2*") (and bool9 bool10 bool11 bool12) #f)

;SEQUENCIAL (ALFA;BETA)
(define seq(has-edge? z 'a 'b)) ;seq retorna verdadeiro se tiver aresta de a pra b
(define seq1(has-edge? z 'b 'c)) ;seq1 retorna verdadeiro se tiver aresta de b pra c
(define seq2(= (edge-weight z 'a 'b) 1)) ;seq2 retorna verdadeiro se tiver aresta de a pra b com peso 1
(define seq3(= (edge-weight z 'b 'c) 2)) ;seq3 retorna verdadeiro se tiver aresta de b pra c com peso 2
(printf "Esse resultado eh para (Alfa;Beta)\n")
(if (string=? k "1;2") (and seq seq1 seq2 seq3) #f)

;SEQUENCIAL (BETA;ALFA)
(define seq4(has-edge? z 'a 'b)) ;seq4 retorna verdadeiro se tiver aresta de a pra b
(define seq5(has-edge? z 'b 'c)) ;seq5 retorna verdadeiro se tiver aresta de b pra c
(define seq6(= (edge-weight z 'a 'b) 2)) ;seq6 retorna verdadeiro se tiver aresta de a pra b com peso 2
(define seq7(= (edge-weight z 'b 'c) 1)) ;seq7 retorna verdadeiro se tiver aresta de b pra c com peso 1
(printf "Esse resultado eh para (Beta;Alfa)\n")
(if (string=? k "2;1") (and seq4 seq5 seq6 seq7) #f)

;UNIAO (ALFA U BETA) ou (1U2)
(define uni(has-edge? z 'a 'b)) ;seq4 retorna verdadeiro se tiver aresta de a pra b
(define uni1(has-edge? z 'a 'c)) ;seq5 retorna verdadeiro se tiver aresta de a pra c
(define uni2(= (edge-weight z 'a 'b) 1)) ;seq2 retorna verdadeiro se tiver aresta de a pra b com peso 1
(define uni3(= (edge-weight z 'a 'c) 2)) ;seq3 retorna verdadeiro se tiver aresta de b pra c com peso 2
(printf "Esse resultado eh para (Alfa U Beta)\n")
(if (string=? k "1U2") (and uni uni1 uni2 uni3) #f)

;UNIAO (BETA U ALFA) ou (2U1)
(define uni4(has-edge? z 'a 'b)) ;seq4 retorna verdadeiro se tiver aresta de a pra b
(define uni5(has-edge? z 'a 'c)) ;seq5 retorna verdadeiro se tiver aresta de a pra c
(define uni6(= (edge-weight z 'a 'b) 2)) ;seq2 retorna verdadeiro se tiver aresta de a pra b com peso 1
(define uni7(= (edge-weight z 'a 'c) 1)) ;seq3 retorna verdadeiro se tiver aresta de b pra c com peso 2
(printf "Esse resultado eh para (Beta U Alfa)\n")
(if (string=? k "2U1") (and uni4 uni5 uni6 uni7) #f)


