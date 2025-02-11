import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;

public class script {

    public static void countingSort(int[] array) {
        int size = array.length;
        int[] output = new int[size];

        int max = Arrays.stream(array).max().getAsInt();
        int[] count = new int[max + 1];

        for (int i = 0; i < size; i++) {
            count[array[i]]++;
        }

        for (int i = 1; i <= max; i++) {
            count[i] += count[i - 1];
        }

        for (int i = size - 1; i >= 0; i--) {
            output[count[array[i]] - 1] = array[i];
            count[array[i]]--;
        }

        System.arraycopy(output, 0, array, 0, size);
    }

    public static void main(String[] args) {
        int[] data = {4, 2, 2, 8, 3, 3, 1};
        countingSort(data);

        try (FileWriter fileWriter = new FileWriter("Java/java_output.txt")) {
            for (int num : data) {
                fileWriter.write(num + "\n");
            }
            System.out.println("Output has been saved to Java_output.txt");
        } catch (IOException e) {
            System.out.println("An error occurred while writing to the file.");
            e.printStackTrace();
        }
    }
}
