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
void formaLista(Node? no, var entrada){
  double tamanho = (entrada.length - 1)/3;
  for(int t=1; t < tamanho.floor(); t++){
    criarNo(no);
  }
}
void setValor(Node? no, double valor){
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


void main() {
	Node noIni = Node();
  criarNo(noIni);
  print("informe um valor: ");
  final entrada = stdin.readLineSync();
  double valor = double.parse("${entrada}");
  print(entrada?.length);
  formaLista(noIni,entrada);
  setValor(noIni,valor);
  valor = valor/100;
  print(noIni.valor);
  print(noIni.prox?.valor);
  print(noIni.prox?.prox?.valor);
  print(noIni.prox?.prox?.prox?.valor);
  print(noIni.prox?.prox?.prox?.prox?.valor);
  //setValor(noIni);
  //print("valor de um no: ${noIni.valor}");
  //print("valor de outro no: ${noIni.prox?.valor}");
}
