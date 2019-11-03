void compute_ranks(float *F, int N, int *R, float *avg, float *passing_avg, int *num_passed) {
    
    if (N > 0) {
        //rank and rank1 will hold R[i] and R[i+1] to reduce memory accesses until necessary
    	int i, j, rank, rank1;
        //cmp and cmp1 will hold F[j] and F[j+1] to reduce memory references
    	float curr, curr1, cmp, cmp1;
        //np = *num_passed, a = *avg, pa = *passing_avg to reduce memory references
    	int np = 0;
    	float a = 0.0;
    	float pa = 0.0;
    	int loop_count = N-1;
        //check if N is odd, if so we need to take care of corner case in unrolled for loops
        int isOdd = (loop_count%2 == 0) ? 1 : 0;
        //ALL FOR LOOPS are unrolled, they will run N/2 times at most and thus handles even and odd entries in one loop
        for (i = 0; i < loop_count; i+=2) {
            // init ranks
            rank = 1; //R[i] is held by rank
            rank1 = 1; //R[i+1] is held by rank1
            // compute averages of F[i]
            curr = F[i];
            a += curr;
            (curr >= 50.0) ? pa += curr, np++ : 0;
            // compute averages of F[i+1]
            curr1 = F[i+1];
            a += curr1;
            (curr1 >= 50.0) ? pa += curr1, np++ : 0;
            // compute ranks
            for (j=0; j<loop_count; j+=2) {
                cmp = F[j];
                (curr < cmp) ? rank++ : 0; //F[i] < F[j] then R[i]++
                (curr1 < cmp) ? rank1++ : 0; //F[i+1] < F[j] then R[i]++
                cmp1 = F[j+1];
                (curr < cmp1) ? rank++ : 0; //F[i] < F[j+1] then R[i]++ 
                (curr1 < cmp1) ? rank1++ : 0; //F[i+1] < F[j+1] then R[i]++
            }
            if (isOdd) {
                cmp = F[loop_count];
                (curr < cmp) ? rank++ : 0; //F[i] < F[N-1] then R[i]++
                (curr1 < cmp) ? rank1++ : 0; //F[i+1] < F[N-1] then R[i+1]++
            }
            R[i] = rank;
            R[i+1] = rank1;
        }
        if (isOdd) {
            R[loop_count] = 1;
            //F[N-1] has not been looped, last element missed due to N being odd
            rank = 1;
            curr = F[loop_count];
            a += curr;
            (curr >= 50.0) ? pa += curr, np++ : 0;
            for (j = 0; j < loop_count; j+=2) {
                (curr < F[j]) ? rank++ : 0; //F[N-1] < F[j] then R[N-1]++
                (curr < F[j+1]) ? rank++ : 0; //F[N-1] < F[j+] then R[N-1]++
            }
            R[loop_count] = rank;
        }
        // reload variables into function inputs
    	a /= N;
    	*avg = a;
    	*num_passed = np;
    	(np > 0) ? pa /= np, *passing_avg = pa : 0;
	}
} // compute_ranks

