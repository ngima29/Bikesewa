

<%@page import="com.bikesewa.entities.Bike"%>
<%@page import="com.bikesewa.dao.BikeDao"%>
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
  <style>
/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
</style>
<script>
            function bike_company()
            {
                var a = document.getElementById("input").value;
                if (a === "Bajaj")
                {
                    var arr = ["Avenger-Street-150", "Avenger-Street-180", "Avenger-Street-220", "Discover-110", "Discover-125", "Discover-135", "Discover-150", "Platina-110", "Pulsar-150", "Pulsar-180", "Pulsar-220", "Pulsar-NS160", "Pulsar-NS200", "Pulsar-RS200", "V-12", "Bajaj-V-15", "Dominar-200", "Dominar-400"];
                }
                if (a === "Yamaha")
                {
                    var arr = ["FZ-25", "FZSV-20", "Fz-v3", "FZS-VI", "FZS-V2", "MT-15", "Saluto-RX", "YZF-RI", "YZF-RI", "YZF-R15", "YZF-R15-V2", "Ray-ZR-113", "Ray-street-125", "Fascino-113", "Fascino-125", "NMAX-155"];
                }
                if (a === "TVS")
                {
                    var arr = ["Apache-RR-310", "Apache-RTR-160", "Apache-RTR-160", "Apache-RTR-180", "Apache-RTR-200", "Jupiter", "TVS-Ntorq-125", "Stryker-125", "Stryker-125"];
                }

                var string = "";

                for (i = 0; i < arr.length; i++)
                {
                    string=string+"<option value="+arr[i]+">"+arr[i]+"</option>";
                }
                document.getElementById("output").innerHTML = string;
            }
        </script>
    </head>
    
    <body>
     <div class="container">
     <ul class="navbar list-unstyled">
          <li class="logo">
               <h2><a class="text-decoration-none" style="font-size:2rem; color:white; text-shadow: 2px 2px 6px #FF0000;" href="#"> Bike Sewa </a></h2>
          </li>
          
     </ul>
</div>
   <main class="d-flex align-items-center" style="height: 80vh" >
 <div class="container">
   <div class="row mx-auto">
     <div class="col-md-6 offset-md-2">
      <!-- main -->
     <div class="card">
                                                                                <div
                                                                                    class="card-header bg-success text-white text-center"
                                                                                    >
                                                                                    <h5 class="d-flex justify-content-center">
                                                                                        Update Bike
                                                                                    </h5>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                     <form action="UpdateBikeAdm" method="POST" enctype="multipart/form-data">
                                                                                         <% 
                                                                                    int uid = Integer.parseInt(request.getParameter("uid")); 
                                                                                    BikeDao bdo = new BikeDao(ConnectionProvider.getCon());
                                                                                   Bike b = bdo.getBikeByUid(uid) ;
                                                                                %>
                                                                                          <div class="row">
                                                                                            <div class="col">
                                                                                                    <label  class="form-label">Company*</label>
                                                                                                    <select class="form-control" id="input" onchange="bike_company()" value='<%=b.getCompany() %>' name="company" required >
                                                                                                        <option value='<%= b.getCompany() %>'><%= b.getCompany() %></option>
                                                                                                        <option value="Bajaj">Bajaj</option>
                                                                                                        <option value="Yamaha">Yamaha</option>
                                                                                                        <option value="TVS">TVS</option>
                                                                                                    </select>
                                                                                                </div>
                                                                                                <div class="col">
                                                                                                    <label  class="form-label">Model*</label>
                                                                                                    <select placeholder='<%= b.getModel() %>'  id="output" class="form-control" onchange="bike_company1()"   name="model" required > </select>
                                                                                                </div>
                                                                                            </div>
                                                                                            <br>
                                                                                            <div class="row">
                                                                                                <div class="col">
                                                                                                    <label  class="form-label">Picture</label>
                                                                                                    <input type="file" class="form-control"  name="update_bike_img" value='<%= b.getBike_img() %>' required>
                                                                                                </div>
                                                                                                <div class="col">
                                                                                                    <label  class="form-label">Color*</label>
                                                                                                    <input type="text" class="form-control" value='<%= b.getColor() %>' name="color" required>
                                                                                                </div>
                                                                                            </div>

                                                                                            <br>
                                                                                            <!--// bike type check--> 
                                                                                            <script type="text/javascript">
                                                                                                function UShowHideBikeNum(UchkStateBike) {
                                                                                                    var UstateBike = document.getElementById("UstateBike");

                                                                                                    UstateBike.style.display = UchkStateBike.checked ? "block" : "none";
                                                                                                    UstateBike.attributes.required = UchkStateBike.checked ? "required" : "";
                                                                                                    // default bike hidike
                                                                                                    var UDefaultBikNum = document.getElementById("UDefaultBikNum");
                                                                                                    var UbikeNum = document.getElementById('UbikeNum');


                                                                                                    UbikeNum.placeholder = UchkStateBike.checked ? "01 001 PA 1010" : "BA 34 PA 359";
                                                                                                    var Ustaste = document.getElementById("UstateInput");
                                                                                                    var UstateValue = Ustaste.options[select.selectedIndex].value;

                                                                                                    var UbothBikeNum = document.getElementById("UbikeNum").value;
                                                                                                    document.getElementById("Uoldbike").value = UchkStateBike.checked ? "UstateValue" + " " + "UbothBikeNum"  : "UbothBikeNum";

                                                                                                }   
                                                                                            </script>
                                                                                             <div class="row">
                                                                                                <div class="col" id="UDefaultBikNum">
                                                                                                    <label  class="form-label">Bike Number*</label>
                                                                                                    <input type="text" class="form-control" value='<%= b.getBike_num() %>' name="bike_number" maxlength="18" id="UbikeNum" required>
                    <!--                                                                                <input type="text" class="form-control" style="display:none;" name="bike_number_final" id="bikeNumFinal">-->

                                                                                                    <span class="error text-danger font-weight-bold" id="BikeErr"></span>
                                                                                                </div>
                                                                                            </div> 
                                                                                            <div class="row">
                                                                                                <div class="col">
                                                                                                    <label for="UchkStateBike" class="form-label">
                                                                                                        <input type="checkbox" name="checkbx" id="UchkStateBike" onclick="UShowHideBikeNum(this)" />
                                                                                                        New Bike Number System (STATE 3 01 001 PA 1010)
                                                                                                    </label>
                                                                                                    <div id="UstateBike" style="display: none" class="row">
                                                                                                        <div class="col">
                                                                                                            <select id="UstateInput" class="form-control" name="stateInput" >
                                                                                                                <option value="STATE 1">STATE 1</option>
                                                                                                                <option value="STATE 2">STATE 2</option>
                                                                                                                <option value="STATE 3">STATE 3</option>
                                                                                                                <option value="STATE 4">STATE 4</option>
                                                                                                                <option value="STATE 5">STATE 5</option>
                                                                                                                <option value="STATE 6">STATE 6</option>
                                                                                                                <option value="STATE 7">STATE 7</option>
                                                                                                            </select>
                                                                                                        </div> 
                                                                                                    </div>
                                                                                                    <!-- end check box -->
                                                                                                </div>
                                                                                            </div>
                                                                                            <br>
                                                                                            <input type="hidden"  name="bid" value='<%= b.getBid() %>'>
                                                                                            <input type="hidden"  name="uid" value='<%= uid %>'>
                                                                                            
                                                                                            
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
