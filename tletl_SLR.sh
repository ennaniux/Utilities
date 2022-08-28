#!/usr/bin/awk -f

BEGIN{FS=OFS=",";}
 NR>1 {
    x[NR] = $1;
    y[NR] = $2;
    Sx += x[NR];
    Sy += y[NR];
    Sxx += (x[NR] * x[NR]);
    Sxy += (x[NR] * y[NR]);
}
END{
    NN = NR -1 ;
    Mx = Sx/NN;
    My = Sy/NN;
    slope =(NN * Sxy  - Sx * Sy) / (NN * Sxx - (Sx * Sx));
    intercept = (Sy - slope * Sx)/NN;
    printf("Slope: ");
    printf("%5.3f ", slope);
    printf("Intercep: ");
    printf("%5.3f ", intercept);

    rnum=0;
    deno=0;
    for(i=2;i<=NR;i++) {
    estimate=slope*x[i]+intercept;
    rnum += (estimate - My)*(estimate - My);
    deno += (y[i] - My)*(y[i] - My);
       }

    rsq = rnum/deno;
    arsq = 1 - (1 - rsq)*(NN-1)/(NN - 1 - 1);
    printf("r-square: ");
    printf("%5.5f ", rsq);
    printf("Adj-r-square: ");
    printf("%5.5f\n", arsq);

    }



