// Set up a dummy function so we don't pollute the global namespace
(function () {
  "use strict";

  var insertBugs = function(bugs) {

    var list = document.getElementById("bugList");
    list.getElementsByClassName("noneMarker")[0].hidden = true;
    bugs.forEach(function(bug){
      var newLI = document.createElement("li");
      var newText = document.createTextNode(bug.title + ", " + bug.description + ", " + bug.issue_type + ", " + bug.priority + ", " + bug.status);
      newLI.appendChild(newText);
      list.appendChild(newLI);
    });
  };

  var loadBugs = function () {
    var ajax = new XMLHttpRequest();
    console.log("Click!");

    // Replace URL below with the URL for your server.
    var url = location.origin;
    if(url.includes("blog-degranjo746383.codeanyapp.com")){
      ajax.open("GET", 'https://blog-degranjo746383.codeanyapp.com/bugs.json'); 
    }
    else{
      ajax.open("GET", 'https://jrd-bugtracker.herokuapp.com/bugs.json');
    }
    ajax.onreadystatechange = function () {
      console.log("Ajax state: " + ajax.readyState);
      if (ajax.readyState === 4 && ajax.status === 200) {
        console.log("Complete AJAX object:");
        console.log(ajax);
        var bugs = JSON.parse(ajax.responseText);
        console.log("Parsed JSON");
        console.log(bugs);
        insertBugs(bugs);
      } else if (ajax.readyState === 4 && ajax.status !== 200) {
        console.log("There was a problem.  Status returned was " + ajax.status);
      }
    };

    ajax.onerror = function () {
      console.log("There was an error!");
    };

    // Notice that send is asynchronous.  This method does not block,
    // instead, the code in onreadystatechange above runs when the call
    // is complete.
    ajax.send();
  };

// Don't apply the event listeners until the document has loaded.
  document.addEventListener("readystatechange", function () {
    console.log("Ready:  " + document.readyState);
    if (document.readyState === "interactive") {
      var loadButton = document.getElementById("loadButton");
      loadButton.addEventListener("click", loadBugs);
    }
  });
})();