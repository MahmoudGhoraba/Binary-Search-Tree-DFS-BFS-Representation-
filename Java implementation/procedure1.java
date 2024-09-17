public class procedure1 {
    static int index=0;
    public static void main(String[] args) {
        int[] array = {4, 9, 10, 10, 15, 2, 3};
        int[] output = new int[array.length];
        bfsToDfs(array,output,0);
        for(int i=0;i< output.length;i++)
            System.out.print(output[i]+" ");




    }

    public static void bfsToDfs(int[] arr,int[]output,int inputIndex) {
        if (inputIndex >= arr.length) {
            return;
        }
        output[index]=arr[inputIndex];
        ++index;
        bfsToDfs(arr,output,inputIndex*2+1);
        bfsToDfs(arr,output,inputIndex*2+2);
    }
}
