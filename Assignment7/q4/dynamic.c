#include <stdio.h>
#include <stdlib.h>

long *new_42(void) {
    long x;
    long *ret;
    //SOLUTION
    /*
    ret = (long*)malloc(sizeof(long));
    printf("address in new_42 is: %p\n", ret);
    *ret = 42;
    printf("value stored in address in new_42 is: %ld\n", *ret);
    */
    //REMOVE BELOW TO MAKE IT WORK
    x = 42;
    ret = &x;

    return ret;
} // new_42

long N = 10;

void donotmuchofanything(long *a) {
    if (N--) {
    	printf("just entering donotmuchofanything, N is %ld, a* is %ld, a is: %p\n", N, *a, a);
        donotmuchofanything(a);
        N++;
    }
} // donotmuchofanything

