public class WorstFit {
    public static void main(String[] args) {
        int[] blockSize = {100, 500, 200, 300, 600};
        int[] processSize = {212, 417, 112, 426};
        
        int m = blockSize.length;
        int n = processSize.length;
        
        int[] allocation = new int[n];
        
        for (int i = 0; i < n; i++) {
            allocation[i] = -1;
        }
        
        for (int i = 0; i < n; i++) {
            int worstIdx = -1;
            for (int j = 0; j < m; j++) {
                if (blockSize[j] >= processSize[i]) {
                    if (worstIdx == -1 || blockSize[j] > blockSize[worstIdx]) {
                        worstIdx = j;
                    }
                }
            }
            
            if (worstIdx != -1) {
                allocation[i] = worstIdx;
                blockSize[worstIdx] -= processSize[i];
            }
        }
        
        System.out.println("Worst-Fit Algorithm:");
        System.out.println("Process No.\tProcess Size\tBlock No.");
        
        for (int i = 0; i < n; i++) {
            System.out.print((i + 1) + "\t\t" + processSize[i] + "\t\t");
            if (allocation[i] != -1) {
                System.out.println(allocation[i] + 1);
            } else {
                System.out.println("Not Allocated");
            }
        }
    }
}