let numbers = new Set();
function second(id1, id2) {
    let index = Math.random() * 100;
    while (numbers.has(index)) {
        index = Math.random() * 100;
    }
    let cookie = document.getElementById(id1).innerHTML + String(index) + "=" + document.getElementById(id2).innerHTML;
    document.cookie = cookie;
}