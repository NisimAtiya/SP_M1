


#include "NumClass.h"
int rec_fact_(int n){
    if(n==1){
        return 1;
    }
    return n* rec_fact_(n-1);
}
int length_(int n)
{
    if (n == 0)
        return 1;
    int count = 0;
    while (n != 0) {
        n = n / 10;
        ++count;
    }
    return count;
}
int my_pow_(int n, int j) {
    int cnt = 1;
    for(int i = 0; i<j; i++){
        cnt = cnt * n;
    }
    return cnt;
}
int isPrime(int n){

    for(int i=2;i<n;i++){
        if(n%i==0){
            return 0;
        }
    }

    return 1;
}
int isStrong(int n){
    int n_ = n;
    int sum = 0;
    int l = length_(n_);
    for (int i = 0; i < l ; ++i) {
        int j = n_ %10;
        sum += rec_fact_(j);
        n_ = n_/10;
    }
    return (sum==n);
}

