#include <stdio.h>

extern int XOR_FUNC(int a, int b);

int main() {
    printf("XOR test:\n");
    printf("0 ^ 0 = %d\n", XOR_FUNC(0, 0));
    printf("0 ^ 1 = %d\n", XOR_FUNC(0, 1));
    printf("1 ^ 0 = %d\n", XOR_FUNC(1, 0));
    printf("1 ^ 1 = %d\n", XOR_FUNC(1, 1));
    return 0;
}