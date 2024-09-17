public class procedure3 {
    public static void main(String[] args) {
        int[] array1 = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        System.out.println( bfsSearch(array1,15));

    }

    public static int bfsSearch(int[] arr,int target) {
        int index =0;
        return bfsSearchH(arr,target,index);
    }

    public static int bfsSearchH(int[]arr,int target,int index){
        if(index>=arr.length){
            return -1;
        }
        else if (arr[index]==target){
            int level=0;
            ++index;
            while(index!=0){
                index>>=1;
                ++level;
            }
            return level;
        } else {
            return bfsSearchH(arr, target, index + 1);
        }
    }





}


