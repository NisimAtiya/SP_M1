
#include "NumClass.h"

int my_pow(int n, int j) {
    int cnt = 1;
    for(int i = 0; i<j; i++){
        cnt = cnt * n;
    }
    return cnt;
}
int length(long long n)
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
int rec_fact(int n){
    if(n==1){
        return 1;
    }
    return n* rec_fact(n-1);
}
int ezer(int n,int l) {
    if(n==0){
        return 0;
    }
    int lsb = n%10;
    return my_pow(lsb,l)+ ezer(n/10,l);

}
int isArmstrong(int n){
    int l = length(n);
    return ezer(n,l)==n;
}
int  isPalindrome(int n){
    int newN = n;
    if(n<10){
        return 1;
    }
    int l = length(n);

    int t = my_pow(10, l-1) ;
    int i = newN%10;
    int j = newN / t;
    newN = newN % t;
    newN= newN/10;
    return (i == j) && (isPalindrome(newN));
}


