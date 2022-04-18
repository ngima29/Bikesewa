
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
       
        <main class="d-flex align-items-center" style="height: 80vh">
 <div class="container">
   <div class="row">
     <div class="col-md-4 offset-md-4">
      <!-- maila -->
       <div class="card" >
           <div class="card-header bg-success text-white text-center">
              
               <i class="fa fa-user fa-3x" ></i>
               <h1 class="d-flex justify-content-center">Admin Login</h1>
               <br>
            </div>
      <div class="card-body">
          <form action="Alogin" method="POST">
  <div class="mb-3">
    <label  class="form-label"><i class="fa fa-envelope-o" ></i> Email</label>
    <input type="email" class="form-control" name="aemail" required>
  </div>
  <div class="mb-3">
    <label  class="form-label"><i class="fa fa-lock" > </i> Password</label>
    <input type="password" class="form-control" name="apassword" required>
  </div>
  <label class="form-check-label" for="gridCheck">
        <a href="#"> Forgot Password ? </a>
      </label>
      <br> <br>
        <div class="d-flex ">         
  <button type="submit" class="btn btn-success me-5 ">Login</button>
        </div>
    
</form>
  </div>
</div>
<!-- maila -->
  </div>         
 </div>
 </div>
      </main>
        
        
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
