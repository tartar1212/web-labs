handleAjaxSuccess = function (event) {
	[data, status, xhr] = event.detail;
	var result = document.getElementById("result");
	//document.write("~tick")
	if (data.type == "Array") {
		s = "<table><tr><td>sequence</td><td>size</td></tr>"

		let max = [];
		data.value.forEach(function (item, i, arr) {
			if (item.length > max.length) {
				max = item
			}
			if (item.length > 0) {
				s += "<tr><td>" + item + "</td><td>" + item.length + "</td></tr>";
			}
		});

		s += "<tr><td>longest part</td><td>size</td></tr>"
		s += "<tr><td>" + max + "</td><td>" + max.length + "</td></tr>"
	} else {
		s = data.value
		switch (s[s.length-1].charCodeAt(0) - "0".charCodeAt(0)) {
			case 1:
				s = "nil input";
				break;
			case 2:
				s = "incorrect input";
				break;
			case 3:
				s = "no such sequences to output";
				break;
			default:
				s = "unknown error "
		}


	}


	result.innerHTML = "<hr/>(myScript) Result is: " + s +
		"<p>" + "</p>";
}


document.addEventListener('DOMContentLoaded', function () {
	document.querySelector("#input_form").addEventListener(
		'ajax:success', handleAjaxSuccess)
})
