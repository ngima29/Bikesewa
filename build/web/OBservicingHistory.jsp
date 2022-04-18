
<%@page import="com.bikesewa.entities.Bike"%>
<%@page import="com.bikesewa.dao.BikeDao"%>
<%@page import="com.bikesewa.helper.ConnectionProvider"%>
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
       
<main class="d-flex align-items-center" style="height: 80vh">
 <div class="container">

   <div class="row mt-5">
     <div class="col-md-4 offset-md-4">
       <div class="card" >
           <div class="card-header bg-success text-white text-center"> 
               <h5 class="d-flex justify-content-center">Add Servicing Details</h5>
            </div>
      <div class="card-body">
           <% 
                   int uid = Integer.parseInt(request.getParameter("uid"));
                   BikeDao bdo = new BikeDao(ConnectionProvider.getCon());
                   Bike b = bdo.getBikeByUid(uid) ;         
               %>
          <form action="AddServicingHistory" method="POST">

  <div class="mb-3">
    <label  class="form-label"> Amount*</label>
    <input type="number"name="amount" class="form-control"required>
  </div>

  <div class="mb-3">
    <label class="form-label">KM*</label>
    <input type="number"  name="Km" class="form-control" required>
  </div>
   <div class="mb-3">
    <label class="form-label">Mechanic ID*</label>
    <input type="number"  name="mid" class="form-control" required>
  </div>
  <div class="mb-3">
    <label class="form-label">Parts Changed*</label>
    <textarea  name="partsChange" rows="4" cols="30" class="form-control text-start"></textarea>
  </div>
     <input type="hidden"  value="<%= b.getBike_num() %>" name="bikeNum"  >
     <input type="hidden"  value="<%= b.getBid() %>" name="bid"  >
    <input type="hidden" value="<%= uid %>" name="uid">
  
   
 
        
        <div class="d-flex ">         
  <button type="submit" class="btn btn-success me-5">Save</button>

        </div>
    
</form>
  </div>
</div>
  </div>         
 </div>
 
 </div>
      </main>
        
        
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>



                     