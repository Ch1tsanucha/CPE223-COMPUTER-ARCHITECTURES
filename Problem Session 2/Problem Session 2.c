#include <stdio.h>

void onecom(int in[]) {

  for (int i = 0; i < 8; i++) {
    in[i] = in[i] == 0 ? 1 : 0;
  }
}

void twocom(int in[], int size) {

  int c = in[size - 1];
  int i = size - 1;
  //ตัวท้ายเป็นจาก 0 ให้เป็น 1
  if (c == 0) {
    in[size - 1] = 1;
  } else {
    // ตัวท้ายเป็น 1 ให้เป็น 0 เจอ 0 หยุด
    while (1) {
      if (in[i] == 1) {
        in[i] = 0;
        i--;
      } else {
        in[i] = 1;
        break;
      }
    }
  }
}

void sign(int in, int prefix) {

  int arr1[8] = {0};
  int arr2[8] = {0};
  int temp1 = 0;
  int temp2 = 0;
  int max = 7;
  int sum = in;

  if (sum < 0)
    sum = sum * (-1);

  int position = 0;
  // หารเอาเศษ เพื่อให้ได้ binary
  while (1) {
    temp1 = sum % 2;
    sum = sum / 2;
    arr1[position] = temp1;
    position++;
    if (sum == 0)
      break;
  }
  // สลับตำแหน่งหน้าหลัง
  for (int i = 0; i < 4; i++) {
    temp2 = arr1[i];
    arr1[i] = arr1[max];
    arr1[max] = temp2;
    max--;
  }
  // coppy ใส่ array 2
  for (int i = 0; i < 8; i++) {
    arr2[i] = arr1[i];
  }
  //เปลี่ยนตัวหน้าเป็น + -
  if (prefix == 1) {
    arr1[0] = 1;
  } else {
    arr1[0] = in < 0 ? 1 : 0;
  }
  // แสดงค่า sign magnitude
  printf("sign magnitude: ");
  for (int i = 0; i < 8; i++) {
    printf("%d", arr1[i]);
  }
  printf("\n");

  ///////////////////////////
  // แสดงค่า 1's complement:
  onecom(arr2);
  printf("1's complement: ");
  if (in < 0) {
    for (int i = 0; i < 8; i++) {
      printf("%d", arr2[i]);
    }
  } else if (prefix == 1) {
    for (int i = 0; i < 8; i++) {
      printf("%d", arr2[i]);
    }
  } else {
    for (int i = 0; i < 8; i++) {
      printf("%d", arr1[i]);
    }
  }
  printf("\n");
  
  ///////////////////////////
  // แสดงค่า /'s complement:
  int size = sizeof(arr2) / sizeof(arr2[0]);
  twocom(arr2, size);
  printf("2's complement: ");
  if (in < 0) {
    for (int i = 0; i < 8; i++) {
      printf("%d", arr2[i]);
    }
  } else if (prefix == 1) {

    printf("NULL");

  } else {
    for (int i = 0; i < 8; i++) {
      printf("%d", arr1[i]);
    }
  }
  printf("\n");
}

int main() {

  int in;
  int prefix = 0;
  char first;
  int count = 0;

  printf("Input an integer: ");

  scanf("%d", &in);
  if (in == 0) {
    printf("0 is positive or negative?\n");
    printf("Enter 0 is positive, 1 is negative: ");
    scanf("%d", &prefix);
  }
  sign(in, prefix);
  return 0;
}
