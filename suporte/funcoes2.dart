void main(List<String> args) {
  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8];

  List<int> menores = numeros.where(
    (int elemento) => elemento < 5
    ).toList();

  print("NUMEROS MENORES QUE 5\n");
  print(menores);

  List<int> pares = numeros.where(
    (int elementos) => elementos % 2 == 0
    ).toList();

  print("NUMEROS PARES:\n");
  print(pares);

  int soma = numeros.reduce(
    (int n1, int n2) => n1 + n2
  );

  print("SOMA DOS NUMEROS:\n");
  print(soma);
}