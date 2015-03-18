<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/restaurant.css" />
<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/dataTable.css" />			
<script src="http://code.jquery.com/jquery-latest.min.js"></script>		
<script type="text/javascript">
        var contexPath = "<%=request.getContextPath() %>";
</script>
</head>
<body style="background-image: url(../images/cofee.jpg); background-repeat: repeat; width:100%; height:100%;">
<a href="<%=request.getContextPath()%>/pages/main.jsp"><input type="button" value="Go to Home Page"/></a>
<h1 style="color:white">Select your hot drinks</h1>
<div id="tablediv">
<table id="drinksTable" class="display" cellspacing="0" width="100%">
	<thead>
        <tr>
        	<th><input type="checkbox" id="selectall"/></th>
            <th scope="col" align="left">Item Name</th>
            <th scope="col" align="left">Price</th>
            <th scope="col" align="left">Tax</th>
            <th scope="col" align="left">Total</th>
        </tr>
	</thead>
 
</table>
</div>
<SCRIPT language="javascript">

  	$.ajax({
    		type: "GET",
    		url: contexPath + "/restaurantCtrlr/hotdrinks/",
    		contentType: "application/json",
    		dataType: "json",
    		success: function(response){
    			if(response !=null){
    				$("#drinksTable").find("tr:gt(0)").remove();
    				var table1 = $("#drinksTable");
    				$.each(response, function(key,value) { 
    					var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
	                   //    rowNew.children().eq(0).text(value['id']); 
	                       rowNew.children().eq(1).text(value['item_name']); 
	                       rowNew.children().eq(2).text(value['price']); 
	                       rowNew.children().eq(3).text(value['tax']); 
	                       rowNew.children().eq(4).text(value['total']); 
	                       rowNew.appendTo(table1);	
    				});
    			}
    			
    		}
    	})
    

</SCRIPT>
</body>
</html>