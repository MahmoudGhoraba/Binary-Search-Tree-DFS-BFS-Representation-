public class procedure4 {
    static int inputI=0;
    public static void main(String[] args) {
        int[] array1 = {4,9,10,15,10,2,3};
        System.out.println( bfsSearchOnDfs(array1,10));

    }

    public static void dfsToBfs(int[]arr,int[]output,int outputIndex){
        if (outputIndex >= arr.length) {
            return;
        }
        output[outputIndex] = arr[inputI];
        ++inputI;
        dfsToBfs(arr, output, outputIndex * 2 + 1);
        dfsToBfs(arr, output, outputIndex * 2 + 2);
    }
    public static int bfsSearchOnDfs(int[]arr,int target){
        int[]output=new int[arr.length];
        dfsToBfs(arr,output,0);
        return bfsSearchOnDfsH(output,target,0);
    }

    public static int bfsSearchOnDfsH(int[]arr,int target,int index){
        if(index>= arr.length){
            return -1;
        }else if (arr[index]==target){
            int level=0;
            ++index;
            while(index!=0){
                index>>=1;
                ++level;
            }
            return level;
        } else {
            return bfsSearchOnDfsH(arr, target, index + 1);
        }
    }
}
