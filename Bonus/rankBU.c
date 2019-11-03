void compute_ranks(float *F, int N, int *R, float *avg, float *passing_avg, int *num_passed) {
    if (N > 0) {
    	int i, j;
    	int loop_count;
    	float curr, curr1;
    	int np = 0;
    	float a = 0.0;
    	float pa = 0.0;
    	loop_count = N-1;
    	// init ranks
    	for (i = 0; i < loop_count; i+=2) {
    	    R[i] = 1;
    	    R[i+1] = 1;
   		}
    	(loop_count%2 != 0) ?  R[loop_count] = 1 : 0;

    	// compute ranks
        loop_count = N-1;
    	for (i = 0; i < loop_count; i+=2) {
        	curr = F[i];
            curr1 = F[i+1];
        	// compute averages
        	a += curr;
        	(curr >= 50.0) ? pa += curr : 0;
        	(curr >= 50.0) ? np += 1 : 0;
            // compute averages
            a += curr1;
            (curr1 >= 50.0) ? pa += curr1 : 0;
            (curr1 >= 50.0) ? np += 1 : 0;
        	for (j = 0; j < N; j++) {
            	(curr < F[j]) ? R[i] +=1 : 0;
                (curr1 < F[j]) ? R[i+1] +=1 : 0;
        	}
    	}
        if (loop_count%2 != 0) {
            curr = F[loop_count];
            a += curr;
            (curr >= 50.0) ? pa += curr : 0;
            (curr >= 50.0) ? np += 1 : 0; 
            for (j = 0; j < N; j++) {
                (curr < F[j]) ? R[i] +=1 : 0;   
            }        
        }

    	// check for div by 0
    	(N > 0) ? a /= N : 0;
    	(N > 0) ? *avg = a : 0;

    	*num_passed = np;
    	(np > 0) ? pa /= np : 0;
    	(np > 0) ? *passing_avg = pa : 0;
	}
} // compute_ranks

