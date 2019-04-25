import java.util.Scanner;

public class Banker {

	public static Scanner in = new Scanner(System.in);

	public static void main(String[] args) {		
		System.out.print("Enter number of resources: ");
		int m = in.nextInt();
		
		System.out.print("Enter number of processes: ");
		int n = in.nextInt();
		
		int[] avail = new int[m];
		int[][] max = new int[n][m];
		int[][] alloc = new int[n][m];
		int[][] need = new int[n][m];
		int[] work = new int[m];
		boolean[] finish = new boolean[n];
		
		System.out.print("\nEnter available resources: ");
		for (int i = 0; i < m; i++) {
			work[i] = avail[i] = in.nextInt();
		}
		
		System.out.println("\nEnter maximum requirement matrix: ");
		acceptMatrix(max, n, m);
		//System.out.println("Maximum requirement matrix: ");
		//displayMatrix(max, n, m);
		
		System.out.println("\nEnter allocation matrix: ");
		acceptMatrix(alloc, n, m);
		//System.out.println("Allocation matrix: ");
		//displayMatrix(alloc, n, m);
		
		need = calculateNeed(max, alloc, n, m);
		
		int[] safeSequence = new int[n];
		int count = 0;
		
		while (count < n) {
			boolean found = false;
			for (int i = 0; i < n; i++) {
				if (!finish[i]) {
					int j;
					for (j = 0; j < m; j++) {
						if (need[i][j] > work[j]) {
							break;
						}
					}
					
					// all resources for process i satisfied
					if (j == m) {
						for (int k = 0; k < m; k++) {
							work[k] += alloc[i][k];		// free resources
						}
						finish[i] = true;
						safeSequence[count++] = i;
						found = true;
					}
				}
			}
			
			if (!found) {
				break;
			}
		}
		
		if (count < n) {
			System.out.println("\nThe system is UNSAFE!");
		} else {
			System.out.println("\nThe system is SAFE. \nSequence: ");
			for (int i = 0; i < n; i++) {
				System.out.print(safeSequence[i] + " ");
			}
		}
	}
	
	public static void acceptMatrix(int[][] mat, int n, int m) {
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < m; j++) {
				mat[i][j] = in.nextInt();
			}	
		}
	}
	
	public static void displayMatrix(int[][] mat, int n, int m) {
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < m; j++) {
				System.out.print(mat[i][j] + " ");
			}
			System.out.println();
		}
	}
	
	public static int[][] calculateNeed(int[][] max, int[][] alloc, int n, int m) {
		int[][] need = new int[n][m];
		
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < m; j++) {
				need[i][j] = max[i][j] - alloc[i][j];
			}
		}
		
		return need;
	}

}
