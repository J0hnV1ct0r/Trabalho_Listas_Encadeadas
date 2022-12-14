import 'dart:io';
//NOME: João Victor de Souza Albuquerque
//MATRICULA: 20211045050314
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

//Cria o no da lista:
void criarNo(Node? no){
  
  if(no?.prox == null){
    Node novoNo = Node();
    no?.set_prox(novoNo);
    novoNo.set_anterior(no);
  }else{
    criarNo(no?.get_prox());
  }
  
}

//Montar a lista:
void formaLista(Node? no, var entrada, bool listDeResul){
  
  double tamanho = (entrada.length - 1)/3;
  
  if(listDeResul){
    tamanho = tamanho + 2;
  }
  
  for(int t = 0; t < tamanho.floor(); t++){
    criarNo(no);
  }
  
}

//Preencher a lista:
void setValoresLista(Node? no, var entrada){
  
  double valor = double.parse("${entrada}");
  
   if(no?.prox != null){
     no?.set_valor(valor.floor()%1000);
     valor = valor/1000;
     setValoresLista(no?.get_prox(),valor);
   }else{
     no?.set_valor(valor.floor()%1000);
   }
  
}


//Função principal de multiplicação:
void multiplicacao(Node? lista1, Node? lista2, Node? resultado){
 
  int sobra = 0;
  
  multiplicaHelp(lista1?.get_valor(),lista2,resultado,sobra);
  
  if(lista1?.prox != null){
    multiplicacao(lista1?.get_prox(),lista2,resultado?.get_prox());
  }
  
}

//Função auxiliar de multiplicação:
void multiplicaHelp(var lista1Valor, Node? lista2, Node? result, int sobra){
  
  int? resp;
  
  result?.valor = result.valor + sobra;
  sobra = 0;
  
  if(result!.valor > 999){
    sobra = sobra + (result.valor/1000).floor();
  }
  
  resp = lista1Valor * lista2!.get_valor();
  
  if(resp != null){
    
    if(resp > 999){
      
      result.valor = result.valor + ((resp).floor()%1000);
      sobra = sobra + (resp/1000).floor();
      
      if(result.valor> 999){
        sobra = sobra + (result.valor/1000).floor();
        result.set_valor(((result.valor).floor()%1000));
      }
      
      if(lista2.prox != null){
        multiplicaHelp(lista1Valor,lista2.get_prox(),result.get_prox(),sobra);
      }else{
        result.prox!.valor = result.prox!.valor + sobra;
        sobra = 0;
      }
      
    }else{
      
      result.valor = result.valor + resp;
      
      if(result.valor> 999){
        sobra = sobra + (result.valor/1000).floor();
        result.set_valor((result.valor).floor()%1000);
      }
      
      if(lista2.prox != null){
        multiplicaHelp(lista1Valor,lista2.get_prox(),result.get_prox(),sobra);
      }else{
        result.prox!.valor = result.prox!.valor + sobra;
        sobra = 0;
      }
      
     }
    
  }
  
}


//Função de saida:
void saida(Node? resultado){
  
  String? saida = "Resultado da Multiplicação: ";
  var listaOut = [];
  String temp = "";
  bool trava = true;
  var cont = 0;
  var pontoCort = 0;
  
  toStringResult(resultado,listaOut);
  
  for(int t = listaOut.length - 1; t >= 0; t--){
     
   if(listaOut[t] == "0"){
     temp = temp + ".000";
   }else if(listaOut[t].length == 2){
      temp = temp + ".0" + listaOut[t];
   }else if(listaOut[t].length == 1){
      temp = temp + ".00" + listaOut[t];
   }else{
      temp = temp + "." + listaOut[t] ;
   }
    
  }
  
  while(trava){
    if(temp[cont] == "0" || temp[cont] == "."){
      cont++;
    }else{
      pontoCort = cont;
      trava = false;
    }
  }
  
  temp = temp.substring(pontoCort);
  saida = saida + temp;
  print(saida);
}

//Passando para String valores da Lista Resultado:
void toStringResult(Node? result,var listaOut){
  
  listaOut.add(result?.valor.toString());
  
  if(result?.prox != null){
    toStringResult(result?.prox,listaOut);
  }
  
  
}


void main() {
  
	Node lista1 = Node(); 
  Node lista2 = Node();
  Node resultado = Node();
  
  print("informe o primeiro valor para a multiplicação: ");
  final entrada = stdin.readLineSync();
  formaLista(lista1,entrada,false);
  setValoresLista(lista1,entrada);
  var tam1 = entrada!.length;
  
  print(" ");
  print("informe o segundo valor para a multiplicação: ");
  final segEntrada = stdin.readLineSync();
  formaLista(lista2,segEntrada,false);
  setValoresLista(lista2,segEntrada);
  var tam2 = segEntrada!.length;
  print(" ");

  //Escolher o tamanho da lista de resultado:
  if(tam1 > tam2){
    formaLista(resultado,entrada,true);
  }else if(tam1 < tam2){
    formaLista(resultado,segEntrada,true);
  }else{
    formaLista(resultado,entrada,true);
  }

  multiplicacao(lista1,lista2,resultado);
  
  saida(resultado);
  
}
