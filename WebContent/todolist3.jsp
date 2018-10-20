
<html>
<head>
<title>Todo App</title>
<!-- <link href='https://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" href="style.css" type="text/css" media="screen"
	charset="utf-8">
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/* Basic Style */
body {
	background: #fff;
	color: #333;
	font-family: Lato, sans-serif;
}

.container {
	display: block;
	width: 700px;
	margin: 100px auto 0;
}

ul {
	margin: 0;
	padding: 0;
}



li * {
	float: left;
}

li, h3 {
	clear: both;
	list-style: none;
}

input, button {
	outline: none;
}

button {
	background: none;
	border: 0px;
	color: #888;
	font-size: 15px;
	width: 60px;
	margin: 10px 0 0;
	font-family: Lato, sans-serif;
	cursor: pointer;
}

button:hover {
	color: #333;
}
/* Heading */
h3, label[for='new-task'] {
	color: #333;
	font-weight: 700;
	font-size: 15px;
	border-bottom: 2px solid #333;
	padding: 30px 0 10px;
	margin: 0;
	text-transform: uppercase;
}

input[type="text"] {
	margin: 0;
	font-size: 18px;
	line-height: 18px;
	height: 18px;
	padding: 10px;
	border: 1px solid #ddd;
	background: #fff;
	border-radius: 6px;
	font-family: Lato, sans-serif;
	color: #888;
}

input[type="text"]:focus {
	color: #333;
}

/* New Task */
label[for='new-task'] {
	display: block;
	margin: 0 0 20px;
}

input#new-task {
	float: left;
	width: 600px;
}

p>button:hover {
	color: #0FC57C;
}

/* Task list */
li {
	overflow: hidden;
	padding: 20px 0;
	border-bottom: 1px solid #eee;
}

li>input[type="checkbox"] {
	margin: 0 10px;
	position: relative;
	top: 15px;
}

li>label {
	font-size: 18px;
	line-height: 40px;
	width: 237px;
	padding: 0 0 0 11px;
}

li>input[type="text"] {
	width: 226px;
}

li>.delete:hover {
	color: #CF2323;
}

/* Completed */
#completed-tasks label {
	text-decoration: line-through;
	color: #888;
}

/* Edit Task */
ul li input[type=text] {
	display: none;
}
tr input[type=text] { display: none; }

tr.editMode input[type=text] {
    display: block;
}


ul li.editMode input[type=text] {
	display: block;
}

ul li.editMode label {
	display: none;
}
</style>




<body>
	<div class="container">
		<p>
			<label for="new-task">Add Item</label><input id="new-task"
				type="text">
			<button>Add</button>
		</p>

		<h3>Todo</h3>
		<ul id="incomplete-tasks">

			<table class="table table-hover" id="myTable">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col" colspan="10" style="padding-right: 115px;" >title</th>
						<th scope="col">day</th>
						<th scope="col">check</th>
						<th scope="col">Edit</th>
						<th scope="col">Delete</th>


					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>



		</ul>

		<h3>Completed</h3>
		<ul id="completed-tasks">
			<li>
		</ul>
		
<p><button onclick="sortTable()">Sort</button></p>

		
	</div>

	<script type="text/javascript" src="app.js"></script>





</body>



<script>
var i=-1;
</script>
<script>

	var taskInput = document.getElementById("new-task");//Add a new task.
	var addButton = document.getElementsByTagName("button")[0];//first button
	var incompleteTaskHolder = document.getElementById("incomplete-tasks");//ul of #incomplete-tasks
	var completedTasksHolder = document.getElementById("completed-tasks");//completed-tasks

	var createNewTaskElement = function(taskString) {

		
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();

		if(dd<10) {
		    dd='0'+dd
		} 

		if(mm<10) {
		    mm='0'+mm
		} 

		today = yyyy +'/'+mm+'/'+dd;
		

		var string = today; 

		var td1= document.createElement("TD");
		i++;
		td1.innerHTML=i;
	     td1.style.width= "40px";

		
		var td2= document.createElement("TD");		
		var label = document.createElement("label");//label
		label.innerText = taskString;
		td2=label;
	     td2.style.width= "230px";
		

		
		var td3 = document.createElement( "TD" ); 
		     td3.innerHTML = string; 
		     td3.style.padding = "3px";
		     td3.style.width= "100px";

		     
		var td4= document.createElement("TD");
		var checkBox = document.createElement("input");//checkbx
		checkBox.type = "checkbox";
		td4=checkBox;
	    td4.style.width= "70px";

		
		var td5= document.createElement("TD");
		var editInput = document.createElement("input");//text
		var editButton = document.createElement("button");//edit button
		editInput.type = "text";
		editButton.innerText = "Edit";//innerText encodes special characters, HTML does not.
		editButton.className = "edit";
		td5=editButton;
	    td5.style.width= "100px";

	
		var td6= document.createElement("TD");
		var deleteButton = document.createElement("button");//delete button
		deleteButton.innerText = "Delete";
		deleteButton.className = "delete";
		td6=deleteButton;
	    td6.style.width= "130px";

		     
		     

		
		     
		var listItem = document.createElement("TR");
		listItem.style.padding="300px";
		listItem.appendChild(td1);
		listItem.appendChild(td2);
		listItem.appendChild(editInput);
		listItem.appendChild(td3);
		listItem.appendChild(td4);
		listItem.appendChild(td5);
		listItem.appendChild(td6);


		return listItem;
	}

	var addTask = function() {
		console.log("Add Task...");
		//Create a new list item with the text from the #new-task:
		var listItem = createNewTaskElement(taskInput.value);

		//Append listItem to incompleteTaskHolder
		incompleteTaskHolder.appendChild(listItem);
		
		bindTaskEvents(listItem, taskCompleted);

		taskInput.value = "";

	}

	//Edit an existing task.
	
	

	var editTask = function() {
		console.log("Edit Task...");
		console.log("Change 'edit' to 'save'");

		var listItem = this.parentNode;

		var editInput = listItem.querySelector('input[type=text]');
		var label = listItem.querySelector("label");
		var containsClass = listItem.classList.contains("editMode");
		if (containsClass) {

			label.innerText = editInput.value;
		} else {
			editInput.value = label.innerText;
		}

		listItem.classList.toggle("editMode");
	}

	var deleteTask = function() {
		console.log("Delete Task...");

		var listItem = this.parentNode;
		var ul = listItem.parentNode;
		ul.removeChild(listItem);

	}

	var taskCompleted = function() {
		console.log("Complete Task...");

		var listItem = this.parentNode;
		completedTasksHolder.appendChild(listItem);
		bindTaskEvents(listItem, taskIncomplete);

	}

	var taskIncomplete = function() {
		console.log("Incomplete Task...");
		var listItem = this.parentNode;
		incompleteTaskHolder.appendChild(listItem);
		bindTaskEvents(listItem, taskCompleted);
	}

	var ajaxRequest = function() {
		console.log("AJAX Request");
	}

	addButton.addEventListener("click", addTask);
	addButton.addEventListener("click", ajaxRequest);
	

	var bindTaskEvents = function(taskListItem, checkBoxEventHandler) {
		console.log("bind list item events");
		var checkBox = taskListItem.querySelector("input[type=checkbox]");
		var editButton = taskListItem.querySelector("button.edit");
		var deleteButton = taskListItem.querySelector("button.delete");

		editButton.onclick = editTask;
		deleteButton.onclick = deleteTask;
		checkBox.onchange = checkBoxEventHandler;
	}

	//cycle over incompleteTaskHolder ul list items
	//for each list item
	for (var i = 0; i < incompleteTaskHolder.children.length; i++) {

		//bind events to list items chldren(tasksCompleted)
		bindTaskEvents(incompleteTaskHolder.children[i], taskCompleted);
	}

	for (var i = 0; i < completedTasksHolder.children.length; i++) {
		bindTaskEvents(completedTasksHolder.children[i], taskIncomplete);
	}

	
</script>





<script>
function sortTable() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementByclass('myTable');
  switching = true;
  while (switching) {
    switching = false;
    rows = table.rows;
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;

      x = rows[i].getElementsByTagName("label")[0];
      y = rows[i + 1].getElementsByTagName("label")[0];
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
</script>
</html>