class Node{
  Node? prox = null;
  var valor; 
  Node? anterior = null;  
  Node(){
    
  }

  void set_valor(var valor){
    this.valor = valor;
  }
  void criarProx(Node no){
    this.prox = Node();
  }  
  void get_valor(){
    return this.valor;
  }
  
}
void criarNo(Node? no){
  if(no?.prox == null){
    Node novoNo = Node();
    no?.prox = novoNo;
    novoNo.anterior = no;
  }else{
    criarNo(no?.prox);
  }  
}
void setValor(){
  
}
void main() {
	Node noIni = Node();
  criarNo(noIni);
  
  
}
