
#include <stdio.h>

int get_byte_by_addr(int *, int i);

int get_byte_by_order(int x, int i) {
    // complete this in Part 2.
    int mask1 = 0xff;
    int count;
    for (int j=0; j<i; j++) {
        x = x >> 8;
    }
    x = x & mask1;
    return x;
    // end of Part 2.
}

int x = 0x01234567;
unsigned int y = 0xffffffd6;

void main () {
    // complete this in Part 1.
    printf("x = %.08x\n", x);
    printf("x = %d\n", x);
    printf("y = %x\n", y);
    printf("y = %d\n", y);
    // end of Part 1

    int i;

    printf("x = ");
    for (i = 0; i < 4; i++) {
        printf("%02x ", get_byte_by_order(x, i));
    }
    putchar('\n');

    printf("x = ");
    for (i = 0; i < 4; i++) {
        printf("%02x ", get_byte_by_addr(&x, i));
    }
    putchar('\n');

    printf("y = ");
    for (i = 0; i < 4; i++) {
        printf("%02x ", get_byte_by_order(y, i));
    }
    putchar('\n');

    printf("y = ");
    for (i = 0; i < 4; i++) {
        printf("%02x ", get_byte_by_addr(&y, i));
    }
    putchar('\n');

    return;
}

