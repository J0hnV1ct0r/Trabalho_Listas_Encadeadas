class Node{
  var endereca_Raiz;
  var valor; 
  var endereco_Folha;  
  Node(){
  }
  void set_endereca_Raiz(var raiz){
    this.endereca_Raiz = raiz;
  }
  void set_valor(var valor){
    this.valor = valor;
  }
  void set_endereco_Folha(var folha){
    this.endereco_Folha = folha;
  }
  void get_endereca_Raiz(){
    return this.endereca_Raiz;
  }
  void get_valor(){
    return this.valor;
  }
  void get_endereco_Folha(){
    return this.endereco_Folha;
  }
  
}

void main() {
	print('Hello World!');
}
