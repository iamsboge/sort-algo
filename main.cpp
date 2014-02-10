#include <stdlib.h>
#include <stdio.h>
#include "sys/time.h"



void swap(int * arr, int i, int j)
{
    int tmp;
    tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
}
int quick(int *arr, int start, int end )
{
    // for (int t = start; t <= end; ++t) {
    //     printf("%d ",arr[t]);
    // }
    // printf("\n");
    //return 0;
    
    int i=start;
    int j=end;
    int tmp = arr[start];

    if (start >= end) {
        return 0;
    }
    
    while (i < j)
    {
        while ((i < j ) && (arr[j] >= tmp)) {
            j--;
        };
        while ((i < j) && (arr[i] <= tmp)) {
            i++;
        };
        if (i<j) {
            swap(arr, i, j);
        }
        // if (arr[i] > arr[start]) {
        //     if (arr[j] < arr[start]) {
        //         swap(arr[i],arr[j]);
        //     } else {
        //         j--;
        //     }
        // } else {
        //     i++;
        // }
    }
    swap(arr,start,j);

    //swap(arr[start],arr[i]);
    quick(arr, start, j-1);
    quick(arr, j+1, end);
    return 0;
}
int my_sort()
{
    FILE * fp;
    fp = fopen("result","rb");
    int j=0;
    int input[100000];
    while(fscanf(fp, "%d", &input[j])!=EOF)
    {
        //puts(result[j]);
        j++;
    }
    // for (int i = 0; i < 100000; ++i) {
    //     printf("%d\n",input[i]);
    // }
    struct timeval tv_s,tv_e;
    gettimeofday(&tv_s,NULL);
    
    //start quick sort
    if (0 != quick(input, 0, 99999)) {
        printf("sort error!\n");
        return -1;
    }
    gettimeofday(&tv_e,NULL);
    for (int i = 0; i < 100000; ++i) {
        printf("%d\n",input[i]);
    }
    printf("elapse time:%d secs %d usecs\n",
           (tv_e.tv_sec-tv_s.tv_sec),(tv_e.tv_usec-tv_s.tv_usec));
    fclose(fp);
    return 0;
}

int main(int argc, char *argv[])
{
    // struct timeval tm;
    // gettimeofday(&tm,NULL);
    // srand(tm.tv_sec);
    // for (int i = 0; i < 100000; ++i) {
    //     printf("%d\n",random()%10000);
    // }
    my_sort();
    // int a = 1;
    // int b = 2;
    // swap (a, b);
    // printf("a[%d],b[%d]",a,b);
    return 0;
}



