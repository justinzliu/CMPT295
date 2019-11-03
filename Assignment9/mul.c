
#include "mul.h"
#include "matrix.h"
#include <stdio.h>
#include <stdlib.h>

int **mul(int **A, int rA, int cA, int **B, int rB, int cB) {

    //initialize new array
    int **D = newMatrix(cB,rB);
    if (D == NULL) return D;
    for (int i=0; i<cB; i++) {
        for(int j=0; j<rB; j++) {
            D[i][j] = B[j][i];
        }
    }

    if (cA != cB) {
        printf("Incompatible multiplication: %d x %d times a %d x %d\n", rA, cA, rB, cB); exit(-1);
    }
    // alg1
    int **C = newMatrix(rA, cB);
    if (C == NULL) return C;

    int i, j, k;
    int sum, r;
    for (i = 0; i < rA; i++) {
        for (j = 0; j < cB; j++) {
            sum = 0;
            for (k = 0; k < cA; k++) {
                sum += A[i][k] * D[j][k];
            }
            C[i][j] = sum;
        }
    }
    freeMatrix(D);



    /*
    // alg2
    int **C = newMatrix(rA, cB);
    if (C == NULL) return C;

    int i, j, k;
    int sum, r;
    for (i = 0; i < rA; i++) {
        for (j = 0; j < cB; j++) {
            C[i][j] = 0;
        }
    }
    for (j = 0; j < cB; j++) {
        for (k = 0; k < cA; k++) {
            r = B[k][j];
            for (i = 0; i < rA; i++) {
                C[i][j] += A[i][k] * r;
            }
        }
    }
    */


    /*
    // alg3
    int **C = newMatrix(rA, cB);
    if (C == NULL) return C;

    int i, j, k;
    int sum, r;
    for (i = 0; i < rA; i++) {
        for (j = 0; j < cB; j++) {
            C[i][j] = 0;
        }
    }
    for (i = 0; i < rA; i++) {
        for (k = 0; k < cA; k++) {
            r = A[i][k];
            for (j = 0; j < cB; j++) {
                C[i][j] += B[k][j] * r;
            }
        }
    }
    */


    return C;
}


