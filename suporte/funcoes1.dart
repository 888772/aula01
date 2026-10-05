// fixa
import 'dart:math';

void exibirOla() {
  print('olá');
}

void exibirMsgPosicional(String msg) {
  print(msg);
}

void exibirMsgNomeado({required String msg}) {
  print(msg);
}

// bool menorQ5(int numero) {
//   return numero < 5;
// }

bool menorQ5(int numero) => numero < 5;

// bool par(int numero) {
//   return numero % 2 == 0;
// }

bool par(int numero) => numero % 2 == 0;

// int soma(int n1, int n2) {
//   return n1 + n2;
// }

int soma(int n1, int n2) => n1 + n2;

void main(List<String> args) {
  exibirOla();
  exibirMsgPosicional(
    'olá mundo - posicional'
  );
  exibirMsgNomeado(
    msg: 'olá mundo - nomeado'
  );
  
  //VARIAVEIS
  int numero = 16;
  int n1 = 10;
  int n2 = 4;

  // VERIFICAR NUM MENOR Q 5
  if (menorQ5(numero) == true) {
    print('numero $numero menor q 5');
  }
  else {
    print('numero $numero maior q 5');
  }

  // VERIFICAR PAR
  if (par(numero) == true) {
    print('numero $numero par');
  }
  else{
    print('numero $numero impar');
  }

  // SOMA
  print(soma(n1, n2));

}