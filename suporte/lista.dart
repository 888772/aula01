void main(List<String> args) {
  // criando uma lista de nomes
  List nomes = ['zé', 'joão', 'maria', 'ana', 'pedro'];

  // adicionando um novo elemento na lista

  nomes.add('cecilia');

  // para saber a quantidade de elementos da lista

  nomes.length;

  // para saber se a lista está vazia

  nomes.isEmpty;
  nomes.length == 0;

  // para saber se a lista não está vazia

  nomes.isNotEmpty;

  // para remover um elemento da lista

  nomes.remove('zé');

  // para remover um elemento da lista pelo índice

  nomes.removeAt(0);

  // para remover o último elemento da lista

  nomes.removeLast(); // sem saber o índice do elemento

  // criando lista tipadas

  List<int> idades = [20, 30, 40, 50, 60];

  // para adicionar um elemento em uma lista tipada

  idades.add(21);

}