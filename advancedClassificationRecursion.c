
#include "NumClass.h"
//int length(int n)
//{
//    if (n == 0)
//        return 1;
//    int count = 0;
//    while (n != 0) {
//        n = n / 10;
//        ++count;
//    }
//    return count;
//}
int my_pow(int n, int j) {
    int cnt = 1;
    for(int i = 0; i<j; i++){
        cnt = cnt * n;
    }
    return cnt;
}
int rec_revers(int n){
    int l = length(n);
    if (l==1){
        return n;
    }
    return rec_revers(n/10)+(n%10*my_pow(10, l- 1));
}
int isPalindrome(int n) {
    return ((n == rec_revers(n)) || (n >= 0 && n < 10));
}
int Armstrong(int n,int l) {
    if(n==0){
        return 0;
    }
    int lsb = n%10;
    return my_pow(lsb,l)+ Armstrong(n/10,l);

}
int isArmstrong(int n){
    int l = length(n);
    return Armstrong(n,l)==n;
}
