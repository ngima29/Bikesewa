<%@page import="com.bikesewa.entities.Message"%>
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
    
  <body class=" bg-light">

        <main class="d-flex align-items-center bg-light" >
 <div class="container-fluid">

<div class="container">
     <ul class="navbar list-unstyled">
          <li class="logo">
               <h2><a class="text-decoration-none" style="font-size:4rem; color:white; text-shadow: 2px 2px 8px #FF0000;" href="index.jsp"> Bike Sewa </a></h2>
          </li>
          <li>
                <div class="d-flex">

    <a class="btn btn-danger btn-lg" href="register.jsp" role="button">Register Now</a> 
      </div>
          </li>
     </ul>
</div>
   <div class="row">
     <div class="col-md-4 offset-md-4">
       <div class="card" >
           <div class="card-header bg-success text-white text-center">
              
               <i class="fa fa-user fa-3x" ></i>
               <h2 class="d-flex justify-content-center">Login</h2>
               <br>
            </div>
           <!--jspppp-->
           <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%= m.getCssClass() %>" role="alert">
                                <%= m.getContent() %>
                            </div> 

                            <%        
                                    session.removeAttribute("msg");
                                }
                            %>

      <div class="card-body">
          <!--login####-->
          
          <form action="login" method="POST">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label"><i class="fa fa-envelope-o" ></i> Email</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" maxlength="18" required>
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-2">
    <label for="exampleInputPassword1" class="form-label"><i class="fa fa-lock" > </i> Password</label>
    <input type="password" class="form-control" id="myInput" name="password" maxlength="10" required>
  </div>
              <div class="mb-3 d-flex justify-content-between">
                  <div>
                      <input type="checkbox" onclick="myFunction()"> Show Password
                  </div>
                  <div>
                      <a href="forgotPassword.jsp"> Forgot Password ? </a>
                  </div>
              </div>
   
              <br>
        <div class="d-flex ">         
  <button type="submit" class="btn btn-success me-5 ">Login</button>
  <a  href="register.jsp" class="btn btn-danger ms-5">Register</a>
        </div>
    
</form>
     
  </div>
</div>
  </div>         
 </div>
 </div>
      </main>
        
<script>
function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
        
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
