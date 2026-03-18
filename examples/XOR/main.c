#include <stdio.h>
#include <stdbool.h>

extern _Bool XOR_FUNC(_Bool a, _Bool b);

int main(void) {
    printf("XOR test:\n");
    printf("0 ^ 0 = %d\n", (int)XOR_FUNC(0, 0));
    printf("0 ^ 1 = %d\n", (int)XOR_FUNC(0, 1));
    printf("1 ^ 0 = %d\n", (int)XOR_FUNC(1, 0));
    printf("1 ^ 1 = %d\n", (int)XOR_FUNC(1, 1));
    return 0;
}