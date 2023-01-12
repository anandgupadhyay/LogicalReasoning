import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;


public class Solution {

static void findPalindrome(int n) {
    int max = 0;
    StringBuilder sb  = new StringBuilder();
    int j;
    for (int i=100; i <=999 ; ++i) {
        if (max == 0) {
            j = 100;
        } else {
            j = max/i;
        }
        for (; j<=999; ++j) {
            sb.setLength(0);
            int res = i * j;
            if (res >= n) {
                break;
            }
            sb.append(res);                
            if (sb.toString().equals(sb.reverse().toString())) {
                if (res > max) {
                    max = res;
                    //System.out.println(i + ", " + j + " : " + max);
                }
            }
        }
    }
    System.out.println(max);
}

    // function reverseNumber(n)
    // {
    //     n = n + "";
    //     return n.split("").reverse().join("");
    // }
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int t = in.nextInt();
        for(int a0 = 0; a0 < t; a0++){
            int n = in.nextInt();
            findPalindrome(n);
        }
        
    }
}
