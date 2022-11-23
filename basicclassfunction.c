#include "NumClass.h"
int rec_fact(int n){
    if(n==1){
        return 1;
    }
    return n* rec_fact(n-1);
}
int length(int n)
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
int isStrong(int n){
    int sum=0;
    int n_=n;
    int i;
    int temp;
    while (n_ > 0){
        i=1;
        temp=n_%10;
        for(int j = 1; j <= temp; j++){
            i *= j;
        }
        sum += i;
        n_/= 10;
    }
    return (sum==n);

}
int isPrime(int n){

    for(int i=2;i<n;i++){
        if(n%i==0){
            return 0;
        }
    }

    return 1;
}
