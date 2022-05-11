// void main(){
// var arr = [1,2,3,4,5,6,7,8,9,];
// int even =0;
// int odd =0;
// for (var i = 0; i < arr.length; i++) {
// if ( i %2 ==0) {
// even += arr[i];
// }else{
// odd +=arr[i];
// }
// }

// }

class oddNumber {
   public static void main(String args[]) {
	int n = 20;
    int sum =0;
	System.out.print("Odd Numbers from 1 to "+n+" are: ");
	for (int i = 1; i <= n; i++) {
	   if (i % 2 != 0) {
		System.out.print(i + " ");
        sum = sum + i;
        System.out.print("The Sum of Odd Numbers from 1 to "+n+" are: "+sum);
        
	   }
	}
   }
}