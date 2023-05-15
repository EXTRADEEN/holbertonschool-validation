---
title: "Welcome to Awesome Inc."
date: 2023-05-01T14:37:06+02:00
draft: true
---

Please enter your name below and click on the button to say hello:

{{< form >}}
{{< input id="name" name="name" label="Name:" >}}
{{< button type="button" onclick="sayHello()" >}}Say Hello{{< /button >}}
{{< /form >}}

{{< div id="result" >}}{{< /div >}}

{{< script >}}
function sayHello() {
  var name = document.getElementById("name").value;
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("result").innerHTML = this.responseText;
    }
  };
  xhr.open("POST", `https://api.example.com/sayhello`, true);
  xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhr.send("name=" + name);
}
{{< /script >}}

{{< sayHello >}}
