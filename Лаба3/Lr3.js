let tags = new Array();
let reg = new RegExp("[а-яa-z01-9]", "i");


function ContainNodes(el, start)
{
	if (el.tagName === "HEAD" || el.tagName === "BODY" || el.tagName === "HTML")
	{
		console.log(el.tagName);
		if (reg.test(el.tagName)) tags.push(start + el.tagName);
		for (var i = 0; i < el.children.length; i++)
		{
		ContainNodes(el.children[i], start + "&nbsp");
		}
	}
	else
	{
		if (el.nodeType === 3)
		{
			console.log(el.nodeValue);
			if (reg.test(el.nodeValue)) tags.push(start + el.nodeValue);
		}
		else
		{
			console.log(el.nodeName);
			if (reg.test(el.nodeName)) tags.push(start + el.nodeName);
		}
		for (var i = 0; i < el.childNodes.length; i++)
		{
			ContainNodes(el.childNodes[i], start + "&nbsp");
		}
	}
}

function WriteNodes()
{
	ContainNodes(document.documentElement, "");
	result = "";
	for (var i = 0; i < tags.length; i++)
	{
		result = result + tags[i] + "<br />";
	}
	document.getElementById("result").innerHTML = '<div id="result">\n' + result + "\n<\div>";
	flag = true;
}
