import 'dart:io';

import 'dart:mirrors';
class Node{
  Node? prox = null;
  int valor = 0; 
  Node? anterior = null;  
  Node(){  
  }
  void set_valor(var valor){
    this.valor = valor;
  }
  int get_valor(){
    return this.valor;
  }
  Node? get_prox(){
    return prox;
  }
  void set_prox(Node? no){
    prox = no;
  }
  Node? get_anterior(){
    return anterior;
  }
  void set_anterior(Node? no){
    anterior = no;
  }
}

//cria o no da lista:
void criarNo(Node? no){
  if(no?.prox == null){
    print("feito");
    Node novoNo = Node();
    no?.set_prox(novoNo);
    novoNo.set_anterior(no);
  }else{
    criarNo(no?.get_prox());
  }  
}
//monta a lista:
void formaLista(Node? no, var entrada, bool listDeResul){
  double tamanho = (entrada.length - 1)/3;
  if(listDeResul){
    tamanho = tamanho + 2;
    print("entrou result");
  }
  for(int t = 0; t < tamanho.floor(); t++){
    criarNo(no);
  }
}
//preencher a lista:
void setValor(Node? no, var entrada){
  double valor = double.parse("${entrada}");
   if(no?.prox != null){
     no?.set_valor(valor.floor()%1000);
     valor = valor/1000;
     print("salvo1");
     setValor(no?.get_prox(),valor);
   }else{
     no?.set_valor(valor.floor()%1000);
     print("salvo2");
   }
}



void multiplicacao(Node? lista1, Node? lista2, Node? resultado){
  print("começou a operação.....");
  int sobra = 0;
  Node? noLast;
  String? saida = "Resultado da Multiplicação: ";
  multiplicaHelp(lista1?.get_valor(),lista2,resultado,sobra);
  if(lista1?.prox != null){
    //multiplicaHelp(lista1?.get_valor(),lista2,resultado,sobra);
    multiplicacao(lista1?.get_prox(),lista2,resultado);
  }else{
    print("fim da operação.....");
  }
  pegarLast(resultado,noLast);
  formarSaida(saida,noLast);
  print(saida);
  
}

void multiplicaHelp(var lista1Valor, Node? lista2, Node? result, int sobra){
  print("operando.....");
  int? resp;
  
  result?.valor = result.valor + sobra;
  sobra = 0;
  if(result!.valor > 999){
    sobra = sobra + (result.valor/1000).floor();
  }
  
  resp = lista1Valor * lista2!.get_valor();
  if(resp != null){
    if(resp > 999){
      result.set_valor(resp.floor()%1000);
      sobra = sobra + (resp/1000).floor();
      if(lista2.prox != null){
        multiplicaHelp(lista1Valor,lista2.get_prox(),result.get_prox(),sobra);
      }else{
        result.prox!.valor = result.prox!.valor + sobra;
        sobra = 0;
      }
    }else{
      result.set_valor(resp.floor()%1000);
      if(lista2.prox != null){
        multiplicaHelp(lista1Valor,lista2.get_prox(),result.get_prox(),sobra);
      }else{
        result.prox!.valor = result.prox!.valor + sobra;
        sobra = 0;
      }
     }
  }
  
}

void pegarLast(Node? result,Node? noLast){
  if(result?.prox != null){
    pegarLast(result?.prox, noLast);
  }else{
    noLast = result;
  }
  
}

void formarSaida(String? saida,Node? noLast){
  String? last = noLast!.valor.toString();
  if(noLast.valor != 0){
    saida = saida !+ last;
  }
  if(noLast.anterior != null){
    formarSaida(saida,noLast.anterior);
  }
}


void main() {
	Node lista1 = Node(); 
  Node lista2 = Node();
  Node resultado = Node();
  
  print("informe o primeiro valor para a multiplicação: ");
  final entrada = stdin.readLineSync();
  formaLista(lista1,entrada,false);
  setValor(lista1,entrada);
  var tam1 = entrada!.length;
  
  print("informe o segundo valor para a multiplicação: ");
  final segEntrada = stdin.readLineSync();
  formaLista(lista2,segEntrada,false);
  setValor(lista2,segEntrada);
  var tam2 = segEntrada!.length;
  print("//////////");

  
  if(tam1 > tam2){
    formaLista(resultado,entrada,true);
    print("entrou na entrada 1");
  }else if(tam1 < tam2){
    formaLista(resultado,segEntrada,true);
     print("entrou na entrada 2");
  }else{
    formaLista(resultado,entrada,true);
  }

  multiplicacao(lista1,lista2,resultado);
}
