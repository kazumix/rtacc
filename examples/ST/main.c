#include <stdio.h>

/* ST 言語で定義した BOOL 反転関数 */
extern int NotBool(int x);

int main(void)
{
    int in_false = 0;
    int in_true  = 1;

    int out_false = NotBool(in_false);
    int out_true  = NotBool(in_true);

    printf("NotBool(0) = %d\n", out_false);
    printf("NotBool(1) = %d\n", out_true);

    return 0;
}

