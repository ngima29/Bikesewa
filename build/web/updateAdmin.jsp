

<%@page import="com.bikesewa.entities.Admin"%>
<%@page import="com.bikesewa.helper.ConnectionProvider"%>
<%@page import="com.bikesewa.dao.AdminDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    
  </head>
    
    <body>
     
   <main class="d-flex align-items-center" style="height: 80vh" >
 <div class="container">
   <div class="row mx-auto">
     <div class="col-md-6 offset-md-2">
      <!-- main -->
       <div class="card" >
           <div class="card-header bg-success text-white text-center">
               <h4 class="d-flex justify-content-center">Update Admin</h4>
            </div>
      <div class="card-body">
         <!--?####FORM-->
 <form action="UpdateAdminServlet" method="POST" enctype="multipart/form-data">
             <% 
                   int aid = Integer.parseInt(request.getParameter("aid")); 
                   AdminDao ado = new AdminDao(ConnectionProvider.getCon());
                  Admin a = ado.getAdminById(aid);
               %>
        <input type="hidden"  value="<%= aid %>" name="aid" >
 <div class="row">
  <div class="col">
      <input type="text" class="form-control" value="<%= a.getFull_name() %>" name="full_name"  required>
  </div>
  <div class="col">
    <input type="email" class="form-control" value="<%= a.getEmail() %>" name="email" required>
  </div>
</div>
         <br>
   <div class="row">
  <div class="col">
    <input type="number" class="form-control" value="<%= a.getPhone() %>" name="phone" required>
  </div>
  <div class="col">
  
      <div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="gender" value="Male">
  <label class="form-check-label">Male</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="gender" value="Female">
  <label class="form-check-label" >Female</label>
</div>
      
  </div>
   </div>   
   <br>
   <div class="row">
  <div class="col">
    <input type="file" class="form-control" value="<%= a.getPhoto() %>" name="photo" required>
  </div>
  <div class="col">
    <input type="number"  class="form-control" name="password" plceholder="Password" required>
  </div>
</div> 
<br>
<div class="row">
  <div class="col">
    <input type="text" class="form-control" value="<%= a.getAddress() %>" name="address" required>
  </div>
</div> 
<br>
 
     <div class="d-flex ">         
         <button type="submit" class="btn btn-danger me-5" name="submit">Submit</button>
     </div>
        
</form>
  </div>
</div>
<!-- ???main -->
  </div>         
 </div>
 </div>
      </main>
        
        
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>