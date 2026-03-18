#include <stdio.h>
#include <stdbool.h>

/* ST 言語で定義した BOOL 反転関数 */
extern _Bool NotBool(_Bool x);

int main(void)
{
    _Bool in_false = 0;
    _Bool in_true  = 1;

    _Bool out_false = NotBool(in_false);
    _Bool out_true  = NotBool(in_true);

    printf("NotBool(0) = %d\n", (int)out_false);
    printf("NotBool(1) = %d\n", (int)out_true);

    return 0;
}

