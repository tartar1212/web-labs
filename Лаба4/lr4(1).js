function input() {
    let input_name = document.getElementById("input_name").value;
    let input_cost = Number(document.getElementById("input_cost").value);
    if (input_name === '' || input_cost === 0 || input_cost === null || isNaN(input_cost)) {
        alert("Input error");
        document.getElementById("input_name").value = "";
        document.getElementById("input_cost").value = "";
        return
    } else {
        arr_cost.push(input_cost);
    }
    document.getElementById("input_name").value = "";
    document.getElementById("input_cost").value = "";
    
    let tbody = document.getElementById('tab1').getElementsByTagName('TBODY')[0];

    let row = document.createElement("TR");
    tbody.appendChild(row);

    let td1 = document.createElement("TD");
    let td2 = document.createElement("TH");
    row.appendChild(td1);
    row.appendChild(td2);

    td1.innerHTML = input_name;
    td2.innerHTML = input_cost;
    let cookie = input_name + "=" + input_cost;
    document.cookie = cookie;
}

function sum() {
    //let sum = 0;
    //for (item of arr_cost) {
     //   sum = sum + item;
    //}
    //document.getElementById("sum").innerHTML = "Итого: " + sum; 
    let sum = 0;
    if (document.cookie === "") {
        return
    }
    var data1 = document.cookie.split(";");
    var data = new Array();
    for (var i = 0; i < data1.length; i++){
    data.push(data1[i].split("="));
    }
    for (var i = 0; i < data.length; i++) {
        sum += Number(data[i][1]);
    }
    document.getElementById("sum").innerHTML = "Итого: " + sum;
}

function get_cookie() {
if (document.cookie === "") {
    return
}
var data1 = document.cookie.split(";");
var data = new Array();
for (var i = 0; i < data1.length; i++){
data.push(data1[i].split("="));
}



for (var i = 0; i < data.length; i++) {
   let tbody = document.getElementById('tab1').getElementsByTagName('TBODY')[0];
   let row = document.createElement("TR");
   tbody.appendChild(row);

    let td1 = document.createElement("TD");
    let td2 = document.createElement("TH");
    row.appendChild(td1);
    row.appendChild(td2);
    
    
    td1.innerHTML = data[i][0].replace(/[0-9,'.']/g, "");
    td2.innerHTML = data[i][1];
    
}
}
