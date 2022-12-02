import 'dart:io';
class Node{
  Node? prox = null;
  var valor = null; 
  Node? anterior = null;  
  Node(){  
  }
  void set_valor(var valor){
    this.valor = valor;
  }
  void get_valor(){
    return this.valor;
  }
}
void criarNo(Node? no){
  if(no?.prox == null){
    print("feito");
    Node novoNo = Node();
    no?.prox = novoNo;
    novoNo.anterior = no;
  }else{
    criarNo(no?.prox);
  }  
}
void setLastNo(Node? noIni, Node? noFim){
  if(noIni?.prox == null){
    print("feito2");
    noIni?.prox = noFim;
    noFim?.anterior = noIni;
  }else{
    setLastNo(noIni?.prox, noFim);
  }  
}
  
void formaLista(Node? no, var entrada, bool listDeResul){
  double tamanho = (entrada.length - 1)/3;
  if(listDeResul){
    tamanho = tamanho + 2;
  }
  for(int t = 0; t < tamanho.floor(); t++){
    criarNo(no);
  }
}

void setValor(Node? no, var entrada){
  double valor = double.parse("${entrada}");
   if(no?.prox != null){
     no?.valor = valor.floor()%1000;
     valor = valor/1000;
     print("salvo1");
     setValor(no?.prox,valor);
   }else{
     no?.valor = valor.floor()%1000;
     print("salvo2");
   }
}

int getValor(Node? no){
   return no?.valor;
}

void multiplicacao(Node? lista1, Node? lista2, Node? resultado){
  var sobra;
  var resp;
  var soma;
  var teste1 = getValor(lista1); 
  var teste2 = getValor(lista2);
  resp = teste1 + teste2;
  print(resp);
  if(resp != null){
    if(resp > 999){
      sobra = (resp/1000).floor();
      print("sobra: ${sobra.runtimeType}");
    }
  }
}


void main() {
	Node lista1 = Node(); 
  Node lista2 = Node();
  Node resultado = Node();
  print("informe o primeiro valor para a multiplicação: ");
  final entrada = stdin.readLineSync();
  formaLista(lista1,entrada);
  setValor(lista1,entrada);
  print("informe o segundo valor para a multiplicação: ");
  final segEntrada = stdin.readLineSync();
  formaLista(lista2,segEntrada);
  setValor(lista2,segEntrada);
  multiplicacao(lista1,lista2,resultado);
}
