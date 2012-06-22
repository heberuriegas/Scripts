package globos;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Scanner;

public class Main {
	
	public static void main(String[] args) throws IOException{

		Scanner in = new Scanner(System.in);
		int n = in.nextInt();
		int c = in.nextInt();
		boolean test = true;
		int temp1 = 0;
		int temp2 = 0;
		int actual = 1;
		
		Hashtable<Integer,Integer> balloons = new Hashtable<Integer,Integer>();
		
		for(int i=0; i<c; i++){
			temp1 = in.nextInt(); temp2 = in.nextInt();
			if(temp1 <= n && temp2 <= n) balloons.put(temp1, temp2);
		}
		
		System.out.print(actual);
		while(test){
			if(balloons.get(actual) != null){
				System.out.print(" "+balloons.get(actual));
				actual = balloons.get(actual);
			}else test = false;
		}
		
	}
	
}