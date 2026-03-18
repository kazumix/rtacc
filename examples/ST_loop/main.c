#include <stdio.h>

/* ST 側で生成される POU 関数（STloop.st -> STloop） */
extern int STloop(void);

int main(void)
{
    int rc = STloop();
    printf("STloop() returned %d\n", rc);
    return rc;
}
