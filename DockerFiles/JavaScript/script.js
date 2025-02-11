const fs = require('fs');

function countingSort(array) {
    let size = array.length;
    let output = new Array(size).fill(0);
    let max = Math.max(...array);
    let count = new Array(max + 1).fill(0);

    for (let i = 0; i < size; i++) {
        count[array[i]]++;
    }

    for (let i = 1; i <= max; i++) {
        count[i] += count[i - 1];
    }

    for (let i = size - 1; i >= 0; i--) {
        output[count[array[i]] - 1] = array[i];
        count[array[i]]--;
    }

    for (let i = 0; i < size; i++) {
        array[i] = output[i];
    }
}

let data = [4, 2, 2, 8, 3, 3, 1];
countingSort(data);

let filePath = 'JavaScript/js_output.txt';
fs.writeFileSync(filePath, data.join('\n'), 'utf8');

console.log(`Output has been saved to ${filePath}`);
