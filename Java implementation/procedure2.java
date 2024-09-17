public class procedure2 {
    static int index = 0;

    public static void main(String[] args) {
        int[] array = {4, 9, 10, 15, 10, 2, 3};
        int[] output = new int[array.length];
        dfsToBfs(array, output, 0);
        for (int i = 0; i < output.length; i++)
            System.out.print(output[i] + " ");
        }

        public static void dfsToBfs ( int[] arr, int[] output, int outputIndex){
            if (outputIndex >= arr.length) {
                return;
            }
            output[outputIndex] = arr[index];
            ++index;
            dfsToBfs(arr, output, outputIndex * 2 + 1);
            dfsToBfs(arr, output, outputIndex * 2 + 2);
        }


}
