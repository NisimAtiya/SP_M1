
#include "NumClass.h"
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
int my_pow(int n, int j) {
    int cnt = 1;
    for(int i = 0; i<j; i++){
        cnt = cnt * n;
    }
    return cnt;
}
int  isPalindrome(int n){
    int copy = n;
   int i = 0;
   int j = length(n) - 1;
   int arr[j+1];
    while (n>0){
        arr[i] = copy%10;
        copy = copy/10;
        i++;
    }
    i=0;
    while (i<=j){
        if(arr[i]!=arr[j]){
            return 0;
        }
        i++;
        j--;
    }
    return 1;
}
int isArmstrong(int n){

    int l = length(n);
    int copy=n,sum=0;
    for(int i=0;i<l;i++){
        int j = copy%10;
        sum += my_pow(j,l);
        copy = copy/10;
    }
    return (sum==n);

}

