

<%@page import="com.bikesewa.entities.Servicinghistory"%>
<%@page import="com.bikesewa.dao.AddServicingHistoryDao"%>
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
       <div class="card" >
           <div class="card-header bg-success text-white text-center">
               <h4 class="d-flex justify-content-center">Update Servicing Details</h4>
            </div>
      
         <!--?####FORM-->
                                                                                <div class="card-body">
                                                                                    <!--?####FORM-->
                                                                                    <form action="UpdateServicingServlet" method="POST">
                                                                                        <% 
                                                                                int sid = Integer.parseInt(request.getParameter("sid")); 
                                                                                AddServicingHistoryDao asdao = new AddServicingHistoryDao(ConnectionProvider.getCon());
                                                                                Servicinghistory sh= asdao.getServicinghistoryById(sid);
                                                                            %>
                                                                            <input type="hidden"  value="<%= sid %>" name="sid" >
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <label class="form-label"
                                                                                                       >Bike Number*</label
                                                                                                >
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    value="<%= sh.getBike_num() %>" 
                                                                                                    name="bikeNum" maxlength="20"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <label class="form-label">Amount*</label>
                                                                                                <input
                                                                                                    type="number"
                                                                                                    class="form-control"
                                                                                                     value="<%= sh.getAmount() %>" 
                                                                                                    name="amount"
                                                                                                    required onKeyPress="if (this.value.length == 6) return false;"
 
                                                                                                    />
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <label class="form-label"> KM*</label>
                                                                                                <input
                                                                                                    type="number"
                                                                                                    class="form-control"
                                                                                                    value="<%= sh.getKm() %>" 
                                                                                                    name="Km"
                                                                                                    required onKeyPress="if (this.value.length == 5) return false;"

                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <label class="form-label"
                                                                                                       >Customer Name*</label
                                                                                                >
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                     value="<%= sh.getScname() %>" 
                                                                                                    name="cname"
                                                                                                    required  maxlength="15" 
                                                                                                    />
                                                                                            </div>
                                                                                        </div>

                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <div class="row">
                                                                                                    <label class="form-label">
                                                                                                        Customer Id*</label
                                                                                                    >
                                                                                                    <input
                                                                                                        type="number"
                                                                                                        class="form-control"
                                                                                                       onKeyPress="if (this.value.length == 4) return false;"
                                                                                                        name="cid"
                                                                                                         value="<%= sh.getScid() %>" 
                                                                                                        required  
                                                                                                        />
                                                                                                </div>
                                                                                                <div class="row">
                                                                                                    <label class="form-label">
                                                                                                        Mechanic ID*</label
                                                                                                    >
                                                                                                    <input
                                                                                                        type="number"
                                                                                                        class="form-control"
                                                                                                         value="<%= sh.getMid() %>" 
                                                                                                        name="mid"
                                                                                                        required onKeyPress="if (this.value.length == 2) return false;"
                                                                                                        />
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col">
                                                                                                <label class="form-label">Parts Changed</label>
                                                                                                <textarea
                                                                                                    class="form-control"
                                                                                                    name="partsChange"
                                                                                                    rows="4"
                                                                                                    cols="25"
                                                                                                     
                                                                                                     required
                                                                                                    maxlength="50"> <%= sh.getParts_changed() %> </textarea>
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="d-flex">
                                                                                            <button
                                                                                                type="submit"
                                                                                                class="btn btn-danger me-5"
                                                                                                name="submit"
                                                                                                >
                                                                                                Submit
                                                                                            </button>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                                                     <div class="modal-footer">
    <a type="button" class="btn btn-secondary"  href="admin_dashboard.jsp"> Close </a>
    </div>
                                                                         
<!-- ???main -->
       
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
