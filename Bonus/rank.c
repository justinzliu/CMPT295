void compute_ranks(float *F, int N, int *R, float *avg, float *passing_avg, int *num_passed) {
    if (N > 0) {
    	int i, j, isOdd;
    	float curr, curr1, cmp, cmp1;
    	int np = 0;
    	float a = 0.0;
    	float pa = 0.0;
    	int loop_count = N-1;
        isOdd = (loop_count%2 == 0) ? 1 : 0;

    	// init ranks
    	for (i = 0; i < loop_count; i+=2) {
    	    R[i] = 1;
    	    R[i+1] = 1;
   		}
    	(isOdd) ?  R[loop_count] = 1 : 0;

    	// compute ranks
    	for (i = 0; i < loop_count; i+=2) {
        	curr = F[i];
            curr1 = F[i+1];
        	// compute averages
        	a += curr;
        	//(curr >= 50.0) ? pa += curr, np += 1 : 0;
            (curr >= 50.0) ? pa += curr : 0;
            (curr >= 50.0) ? np += 1 : 0;
            // compute averages
            a += curr1;
            (curr1 >= 50.0) ? pa += curr1, np += 1 : 0;
            for (j = 0; j < loop_count; j+=2) {
                cmp = F[j];
                cmp1 = F[j+1];
                (curr < cmp) ? R[i]+=1 : 0;
                (curr1 < cmp) ? R[i+1]+=1 : 0;
                (curr < cmp1) ? R[i]+=1 : 0;
                (curr1 < cmp1) ? R[i+1]+=1 : 0;
            }
            if (isOdd) {
                (curr < F[loop_count]) ? R[i]+=1 : 0;
            }
    	}
        if (isOdd) {
            curr = F[loop_count];
            a += curr;
            (curr >= 50.0) ? pa += curr, np += 1 : 0;
            //(curr >= 50.0) ? np += 1 : 0; 
            for (j = 0; j < loop_count; j+=2) {
                (curr < F[j]) ? R[loop_count] +=1 : 0;   
            }
            if (isOdd) {
                (curr < F[loop_count]) ? R[loop_count]+=1 : 0;
            }        
        }

    	// check for div by 0
    	a /= N;
    	*avg = a;
    	*num_passed = np;
    	(np > 0) ? pa /= np : 0;
    	(np > 0) ? *passing_avg = pa : 0;
	}
} // compute_ranks

