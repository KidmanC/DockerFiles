import java.io.File

fun countingSort(array: IntArray) {
    val size = array.size
    val output = IntArray(size)

    val max = array.maxOrNull() ?: 0
    val count = IntArray(max + 1)

    for (i in array.indices) {
        count[array[i]]++
    }

    for (i in 1..max) {
        count[i] += count[i - 1]
    }

    var i = size - 1
    while (i >= 0) {
        output[count[array[i]] - 1] = array[i]
        count[array[i]]--
        i--
    }

    for (i in array.indices) {
        array[i] = output[i]
    }
}

fun main() {
    val data = intArrayOf(4, 2, 2, 8, 3, 3, 1)
    countingSort(data)

    val fileName = "Kotlin/kotlin_output.txt"
    File(fileName).printWriter().use { out ->
        data.forEach { out.println(it) }
    }

    println("Output has been saved to $fileName")
}
