
#include <stdio.h>

unsigned times(unsigned, unsigned);

void main () {
    unsigned a = 1;
    unsigned b = 1;
    printf("The product of %u and %u is %u.\n", a, b, times(a,b));
    return;
}

