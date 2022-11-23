#include "NumClass.h"
int my_pow(int n, int j) {
    int cnt = 1;
    for(int i = 0; i<j; i++){
        cnt = cnt * n;
    }
    return cnt;
}
int isPalindrome(int n){
    int n_ = n;
    int l = length(n);
    int reverse_n=0,i;
    for (i = 0; i < l; i++){
        reverse_n=(reverse_n*10)+(n_ % 10);
        n_ = n_/10;
    }
    return(reverse_n == n);
}
int isArmstrong(int n){

    int l = length(n);
    int n_=n,sum=0;
    for(int i=0;i<l;i++){
        int j = n_%10;
        sum += my_pow(j,l);
        n_ = n_/10;
    }
    return (sum==n);

}
