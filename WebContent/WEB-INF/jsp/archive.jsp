<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<head>
	<title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<% 
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(request.getAttribute("adminDetail")==null){response.sendRedirect("/Inbox/empform");}
%>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <!-- Brand/logo -->
            <a class="navbar-brand" href="#">
              <img src="https://png.pngtree.com/svg/20170719/ec5498919c.svg" alt="logo" style="width:40px;">
            </a>
            <!-- Links -->
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="/Inbox/empform/registernewform">Create User</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/Inbox/save/viewnotf">Inbox</a>
              </li>
              <li class="nav-item">
                <a class="nav-link signout"href="/Inbox/empform">Signout</a>
              </li>
            </ul>
            
<p class="adminname ml-auto" style="color:white;"><i>logged in as: </</i><b>${adminDetail}</b></p>

        </nav>


        <div class="container-fluid">
                <!-- Control the column width, and how they should appear on different devices -->
                <div class="row">
                  <div class="col-sm-2" data-toggle="collapse" href="#options" style="background-color:#F88C4E; border:2%; min-height:100pt; padding:10pt;">
                    <div class="container">
                            
                            <div>
                                    <ul class="nav flex-column" style="color: beige;">
                                      <li class="nav-item">
                                        <a class="nav-link text-white All" style="font-size:15pt;">All</a>
                                      </li>
                                      <li class="nav-item">
                                        <a class="nav-link text-white Unread" style="font-size:15pt;">Unread</a>
                                      </li>
                                      <li class="nav-item">
                                        <a class="nav-link text-white Archive active" style="font-size:15pt; " ><b>Archive</b></a>
                                      </li>
                                    </ul>
                                    
    
                                  </div>
                            </div>
                          
                </div>
                
                  <div class="col-sm-10 sc" style="background-color:rgb(204, 204, 204); border:2%; min-height:100pt;">
                    <h2 style="margin-left:15px;margin-top:10px">Archive</h2>
                    <div class="container row">
                      <div class="col-sm-7">
                        <input class="form-control" id="myInput" type="text" placeholder="Search..">
                      </div>
                      <div class="col-sm-5">
                              <button type="button" class="btn btn-default btn-lg " style="background-color:#F88C4E"><img src="\Inbox\svg\search.svg"/></button>
                              <button type="button" class="btn btn-default btn-lg delete" style="background-color:#F88C4E"><img src="\Inbox\svg\trashcan.svg"/></button>
                              <button type="button" class="btn btn-default btn-lg archive" style="background-color:#F88C4E"><img src="\Inbox\svg\archive.svg"/></span></button>
                             
                      </div>
                    </div>
                 
                         <table class="table table-inbox table-hover myclass" id="myTable">
                      <tbody>
                      <c:forEach var="msg" items="${list}">
                      <c:if test="${ msg.delete==false && msg.archive==true}">
                        <tr >
                            <td class="inbox-small-cells">
                                <input type="checkbox" class="mail-checkbox" value="${msg.serial}">
                            </td>
                            <td class="table-row"  data-toggle="modal" data-target="#myModal">${msg.serial}</td>
                            <td class="inbox-small-cells"><i class="glyphicon glyphicon-star"></i></td>
                           
                            <td id = "hi" class="view-message  dont-show bold"><div class="table-row"  data-toggle="modal" data-target="#myModal">${msg.sender}</div></div></td>
                            <td class="view-message ">${msg.subject}<td>
                            
                            <td class="view-message  inbox-small-cells"><i class="fa fa-paperclip"><div class="table-row"  data-toggle="modal" data-target="#myModal">${msg.content}</div></i></td>
                            <td class="view-message  date">${msg.date}</td>
                            <td class="view-message  text-right">${msg.time}</td>
                        </tr></c:if>
                        </c:forEach>
                        </tbody>
                        </table>
                  </div>
                </div>
        </div>
        <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title"><span id="sub" /></h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                      <p>${msg.content}</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default approve" id="approve">Approve</button>
                        <button type="button" class="btn btn-default close" data-dismiss="modal">Close</button>
                    </div>
                  </div>
              
                </div>
              </div>
        <script type="text/javascript">
       

        $(document).ready(function(){
          $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
          });
        });
        
        $(document).ready(function($){
        	$(".table-row").click(function(){
        		var item = $(this).closest("tr").text();
        		item = item.replace(/\s+/g,' ').trim();
        		
        		//document.write($item);
        		//javascript:window.location.href="/read"
        		//serial = item.split(" ",1);
        	 temp = item.split(" ");
        	
     		
        		document.getElementById("sub").innerHTML=" Notification ID: "+temp[0]+"<br>"+" Sender: "+ temp[1]+"<br>"+temp[2]+ " " + temp[3]+"<br>"+
        		" Name: "+ temp[4]+" <br>"+" Email : "+temp[temp.length-4]+"<br>"+" Mobile : "+temp[temp.length-3] ;
        		
        		
        	});
        });
        
        
        $(document).ready(function($){
        	$(".close").click(function(){
        		var item = document.getElementById("sub").innerHTML;
        		//item = item.replace(/\s+/g,' ').trim();
        		serial = parseInt(item.split(" ")[2]);
        		//document.write("/Inbox/viewnotf/read/"+item.split(" ")[2]);
        /* 	item = item.replace(/\s+/g,' ').trim(); */
        		javascript:window.location.href="/Inbox/save/read/"+serial;
        location.reload();
        
        	});
        });
        	
        $(document).ready(function($){
        	$(".approve").click(function(){
        		var item = document.getElementById("sub").innerHTML;
        		//item = item.replace(/\s+/g,' ').trim();
        		name = item.split(" ")[8];
        		serial = parseInt(item.split(" ")[3]);
        		//document.write("/Inbox/viewnotf/read/"+serial);
        /* 	item = item.replace(/\s+/g,' ').trim(); */
        		javascript:window.location.href="/Inbox/save/approve/"+name;
        		javascript:window.location.href="/Inbox/save/read/"+serial;
        location.reload();
        
        	});
        });
        
        $(document).ready(function($){
        	$(".delete").click(function(){
        		var favorite = [];
                $.each($("input[type='checkbox']:checked"), function(){ 
                	javascript:window.location.href="/Inbox/save/delete/"+$(this).val();
                    favorite.push($(this).val());
                    });
               // document.write(favorite.join(","));
                location.reload();
        	});
        	});
        
        $(document).ready(function($){
        	$(".archive").click(function(){
        		var favorite = [];
                $.each($("input[type='checkbox']:checked"), function(){ 
                	javascript:window.location.href="/Inbox/save/archive/"+$(this).val();
                    favorite.push($(this).val());
                    });
               // document.write(favorite.join(","));
                location.reload();
        	});
        	});
        
        $(document).ready(function($){
        	$(".Archive").click(function(){
        		//javascript:window.location.href="/Inbox/archive/";
        	location.reload();
        	});
        });
        
        $(document).ready(function($){
        	$(".All").click(function(){
        		//document.write("hello");
        		javascript:window.location.href="/Inbox/save/viewnotf/";
        	//location.reload();
        	});
        });
        $(document).ready(function($){
        	$(".Unread").click(function(){
        		javascript:window.location.href="/Inbox/save/unread/";
        	});
        });
        $(document).ready(function($) {
            $(".signout").click(function() {
                //location.reload)();
                javascript: window.location.href = "/Inbox/save/logout";

                //document.write(adminDetail);
            });
        });
        	
            </script>
    </body>  