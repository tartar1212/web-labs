function show_result(data){
var result = document.getElementById("result");
		if(data.type == "Array"){
			s = "<table><tr><td>sequence</td><td>size</td></tr>"

			let max = [];
			data.value.forEach(function(item, i, arr) {
				if(item.length > max.length){
					max = item
				}
				s+= "<tr><td>" + item + "</td><td>" + item.length + "</td></tr>" ;
			});

			s += "<tr><td>longest part</td><td>size</td></tr>"
			s += "<tr><td>" + max + "</td><td>" + max.length + "</td></tr>"
		} else {
			s = data.value
		}

			result.innerHTML = "<hr/>(myScript) Result is: " + s +
			"<p>"+"</p>";
}
$(document).ready(function(){
 $("#input_form").bind("ajax:success",
 function(xhr, data, status) {
 // data is already an object
 show_result(data)
 })
}) 