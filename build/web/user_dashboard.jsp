<%@page import="com.bikesewa.dao.OnlinebookingDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.bikesewa.entities.Bike"%>
<%@page import="com.bikesewa.dao.BikeDao"%>
<%@page import="com.bikesewa.entities.Message"%>
<%@page import="com.bikesewa.entities.User"%>
<%@page import="com.bikesewa.helper.ConnectionProvider"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="java.util.*" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" /> -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
              rel = "stylesheet">
        <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <link href="jpt.css" rel="stylesheet" type="text/css"/>
        <title>user dashboard</title>
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

    <body class="bg-light">
        <div class="d-flex justify-content-center">
            <%
                Message m = (Message) session.getAttribute("msg");
                if (m != null) {
            %>
            <div class="alert <%= m.getCssClass()%>" role="alert">
                <%= m.getContent()%>
            </div> 

            <%
                    session.removeAttribute("msg");
                }
            %>
        </div>

        <div class="container-fluid">

            <div class="row pt-2">
                <!-- left side navbar start  -->

                <div class="col-lg-3 col-md-4 d-md-block" >
                    <div class=" card  card-left bg-light text-dark" style="height:90vh;">

                        <nav class="navbar navbar-light bg-light">
                            <div class="container-fluid">
                                <a class="navbar-brand" href="#" style="font-size:3rem; color:white; text-shadow: 2px 2px 8px #FF0000;">
                                   Bike Sewa
                                 </a>
                            </div>
                        </nav>
                        <div class="card-body ">
                            <nav class="nav d-md-block  d-none ">
                                
                                <button data-bs-toggle="tab" class="nav-link active mt-3 btn" data-bs-target="#Profile" aria-current="page"  aria-selected="true"><i class=" fas fa fa-user-secret me-2" style="font-size:24px"></i>Profile</button>
                                <button data-bs-toggle="tab" class="nav-link mt-3 btn" data-bs-target="#servicing" aria-selected="false"><i class="fas fa fa-gear me-2" style="font-size:24px" ></i>Servicing</button>
                                <button data-bs-toggle="tab" class="nav-link mt-3 btn" data-bs-target="#Bike" aria-selected="false"><i class="fas fa fa-motorcycle me-2" style="font-size:24px"></i> My Bike </button>
                                <button data-bs-toggle="tab"  class="nav-link mt-3 btn" data-bs-target="#ServicingHistory" aria-selected="false"><i class="fa fa-gears me-2" style="font-size:24px"></i> Servicing History</button>
                                <button data-bs-toggle="tab"  class="nav-link mt-3 btn" data-bs-target="#UserFeedback" aria-selected="false"><i class="fa fa-commenting me-2" style="font-size:24px"></i> FeedBack </button>
                                <button data-bs-toggle="tab"  class="nav-link mt-3 btn" data-bs-target="#ChangePass" aria-selected="false"><i class="fa fa-lock me-2" style="font-size:24px"></i> Change Password </button>

                                <div class=" row mt-4">
                                    <div class="col align-text-bottom d-flex justify-content-center">
                                        <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#logout">
                                            <i class="fas fa fa-power-off me-2" style="font-size:24px"></i>Logout
                                        </button>
                                    </div>
                                </div>

                            </nav>

                        </div>

                    </div>

                </div>
                <!-- left side navbar end  -->

                <!--jsp  message updated start-->

                <!--message updated end-->

                <div class="col-lg-8 col-md-9">
                    <div class="card">
                        <div class="card-header border-bottom mb-3 d-md-none">
                            <!-- for phone lft side  navbar start  -->
                            <ul class="nav nav-tabs card-header-tabs nav-fill">
                                <li class="nav-item">
                                    <a  data-bs-toggle="tab" class="nav-link active" aria-current="page" data-bs-target="#Profile"><i class=" fas fa fa-user-secret me-2" style="font-size:24px"></i></a>
                                </li>
                                <li class="nav-item">
                                    <a data-bs-toggle="tab" class="nav-link" data-bs-target="#servicing"><i class="fas fa fa-gear me-2" style="font-size:24px"></i></a>
                                </li>
                                <li class="nav-item">
                                    <a data-bs-toggle="tab" class="nav-link" data-bs-target="#Bike"><i class="fas fa fa-motorcycle me-2" style="font-size:24px"></i></a>
                                </li>
                                <li class="nav-item">
                                    <a data-bs-toggle="tab"  class="nav-link"  data-bs-target="#ServicingHistory"><i class="fa fa-gears me-2" style="font-size:24px"></i></a>
                                </li>
                                <li class="nav-item">
                                    <a data-bs-toggle="tab"  class="nav-link"  data-bs-target="#UserFeedback"><<i class="fa fa-commenting" style="font-size:24px"></i></a>
                                </li>
                                <li class="nav-item">

                                    <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#logout">
                                        <i class="fas fa fa-power-off me-2" style="font-size:24px"></i> </button>

                                </li>
                            </ul>
                            <!-- for phone lft side  navbar end  -->
                        </div> 

                        <!-- right side contain dispaly start  -->
                        <div class="card-body tab-content  border-0 " style="height:90vh;">
                            <!-- profile start  -->    
                            <div class="tab-pane fade show active " id="Profile">
                                <h1>profile</h1>
                                <div class="container-fluid mt-5">
                                    <div class="row">
                                        <div class="col">
                                            <div class="card mb-3" style="max-width: 740px;">
                                                <div class="row g-0">
                                                    <div class="col-md-4 p-4">
                                                        <div class="row">
                                                            <img src="User_img/<%= user.getImage()%>" class="img-fluid rounded-start img-thumbnail" alt="..." style="width:200px; height: 200px;">
                                                        </div>


                                                        <div class="row">

                                                        </div>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="row mt-2">
                                                            <div class="col">
                                                                <h3 class="card-title ">Basic Info</h3>  
                                                            </div>

                                                        </div>

                                                        <div class="card-body">

                                                            <div class="row d-flex justify-content-between">
                                                                <div class="col">
                                                                    <h6>Full Name</h6>  
                                                                </div>
                                                                <div class="col">
                                                                    <p><%= user.getFull_name()%></p>  
                                                                </div>
                                                            </div>
                                                            <div class="row d-flex justify-content-between">
                                                                <div class="col">
                                                                    <h6>Email</h6>  
                                                                </div>
                                                                <div class="col">
                                                                    <p><%= user.getEmail()%></p>  
                                                                </div>
                                                            </div>
                                                            <div class="row d-flex justify-content-between">
                                                                <div class="col">
                                                                    <h6>Phone</h6>  
                                                                </div>
                                                                <div class="col">
                                                                    <p><%= user.getPhone()%></p>  
                                                                </div>
                                                            </div>
                                                            <div class="row d-flex justify-content-between">
                                                                <div class="col">
                                                                    <h6>Gender</h6>  
                                                                </div>
                                                                <div class="col">
                                                                    <p><%= user.getGender()%></p>  
                                                                </div>
                                                            </div>
                                                            <div class="row d-flex justify-content-between">
                                                                <div class="col">
                                                                    <h6>Address</h6>  
                                                                </div>
                                                                <div class="col">
                                                                    <p><%= user.getAddress()%></p>  
                                                                </div>
                                                            </div>
                                                            <div class="row d-flex justify-content-between">
                                                                <div class="col">
                                                                    <h6>Register Date</h6>  
                                                                </div>
                                                                <div class="col">
                                                                    <p><%= user.getCreated_at()%></p>  
                                                                </div>
                                                            </div>




                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col d-flex justify-content-end">

                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#UpdateProfile">Update Profile</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Update profile   start-->
                            <div class="modal fade" id="UpdateProfile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <div class="modal-body">
                                            <div class="container">
                                                <div class="row mx-auto">
                                                    <div class="col">
                                                        <div class="card" >
                                                            <div class="card-header bg-success text-white text-center">

                                                                <h3 class="d-flex justify-content-center">Update</h3>

                                                            </div>
<!--                                                            // user update validation-->
                                                           <script>
                                                           // Defining a function to display error message
                                                           function printError(elemId, hintMsg) {
                                                               document.getElementById(elemId).innerHTML = hintMsg;
                                                           }

                                                           // Defining a function to validate form 
                                                           function UserVupadeValidateForm() {
                                                               // Retrieving the values of form elements 
                                                               var name = document.contactForm.user_name.value;
                                                               var email = document.contactForm.user_email.value;
                                                               var mobile = document.contactForm.user_phone.value;
                                                               var address = document.contactForm.user_address.value;
                                                               var gender = document.contactForm.gender.value;
                                                           //    var password = document.contactForm.user_password.value;



                                                             // Defining error variables with a default value
                                                               var nameErr = emailErr = mobileErr = addressErr = genderErr =  true;

                                                               // Validate name
                                                               if(name == "") {
                                                                   printError("nameErr", "Please enter your name");
                                                               } else {
                                                                   var regex = /^[a-zA-Z\s]+$/;                
                                                                   if(regex.test(name) === false) {
                                                                       printError("nameErr", "Please enter a valid name");
                                                                   } else {
                                                                       printError("nameErr", "");
                                                                       nameErr = false;
                                                                   }
                                                               }

                                                                // Validate password

                                                           //    if(password == "") {
                                                           //        printError("passwordErr", "Please enter your password");
                                                           //    } else {
                                                           //        var regex = /^[a-zA-Z\s]+$/;                
                                                           //        if(regex.test(password) === false) {
                                                           //            printError("passwordErr", "Please enter a valid password");
                                                           //        } else {
                                                           //            printError("passwordErr", "");
                                                           //            passwordErr = false;
                                                           //        }
                                                           //    }
                                                           //    
                                                               // Validate email address
                                                               if(email == "") {
                                                                   printError("emailErr", "Please enter your email address");
                                                               } else {
                                                                   // Regular expression for basic email validation
                                                                   var regex = /^\S+@\S+\.\S+$/;
                                                                   if(regex.test(email) === false) {
                                                                       printError("emailErr", "Please enter a valid email address");
                                                                   } else{
                                                                       printError("emailErr", "");
                                                                       emailErr = false;
                                                                   }
                                                               }

                                                               // Validate mobile number
                                                               if(mobile == "") {
                                                                   printError("mobileErr", "Please enter your mobile number");
                                                               } else {
                                                                   var regex = /^[1-9]\d{9}$/;
                                                                   if(regex.test(mobile) === false) {
                                                                       printError("mobileErr", "Please enter a valid 10 digit mobile number");
                                                                   } else{
                                                                       printError("mobileErr", "");
                                                                       mobileErr = false;
                                                                   }
                                                               }

                                                               // Validate address
                                                               if(address == "") {
                                                                   printError("addressErr", "Please enter your address");
                                                               } else {
                                                                   var regex = /^[a-zA-Z\s]+$/;                
                                                                   if(regex.test(address) === false) {
                                                                       printError("addressErr", "Please enter a valid address");
                                                                   } else {
                                                                       printError("addressErr", "");
                                                                       addressErr = false;
                                                                   }
                                                               }

                                                               // Validate gender
                                                               if(gender == "") {
                                                                   printError("genderErr", "Please select your gender");
                                                               } else {
                                                                   printError("genderErr", "");
                                                                   genderErr = false;
                                                               }                                       
                                                           };
                                                           </script>                                                         

                                                            <div class="card-body">
                                                                <!--?####FORM-->
                                                                <form  onsubmit="return UserVupadeValidateForm()" action="UpdateUser" method="POST" enctype="multipart/form-data">
                                                                     <div class="row">
                                                                    <div class="col">
                                                                         <span>Full Name</span>
                                                                        <input type="text" class="form-control" value="<%= user.getFull_name() %>" name="full_name" autocomplete="off" maxlength="18" required>
                                                                        <span class="error text-danger font-weight-bold" id="nameErr"></span>
                                                                    </div>
                                                                    <div class="col">
                                                                         <span>Email</span>
                                                                      <input type="email" class="form-control" value="<%= user.getEmail()%>" name="email" maxlength="18" autocomplete="off" required>
                                                                      <span class="error text-danger font-weight-bold" id="emailErr"></span>
                                                                    </div>
                                                                  </div>
                                                                           <br>
                                                                   <div class="row">
                                                                    <div class="col">
                                                                         <span>Phone</span>
                                                                      <input type="text" onKeyPress="if (this.value.length == 10) return false;" class="form-control" value="<%= user.getPhone()%>" name="phone" autocomplete="off" required>
                                                                      <span class="error text-danger font-weight-bold" id="mobileErr"></span>
                                                                    </div>
                                                                    <div class="col">
                                                                         <span>Gender</span>
                                                                    <select
                                                                                                        class="form-select"
                                                                                                        id="autoSizingSelect"
                                                                                                        name="gender"
                                                                                                        required
                                                                                                        >
                                                                                                        <option selectedvalue="male">
                                                                                                            Male
                                                                                                        </option>
                                                                                                        <option value="female">Female</option>
                                                                                                    </select>
                                                                    
                                                                    </div>
                                                                     </div>   

                                                                     <br>
                                                                  <div class="row">
                                                                    <div class="col">
                                                                        <span>Address</span>
                                                                      <input type="text" class="form-control" value="<%= user.getAddress()%>" name="address" autocomplete="off" maxlength="15" required>
                                                                      <span class="error text-danger font-weight-bold" id="addressErr"></span>
                                                                    </div>
                                                                     <div class="col">
                                                                             <span>Image</span>
                                                                            <input type="file" class="form-control"  name="Update_photo" required>
                                                                        </div>
                                                                  </div> 
                                                     
                                                                   
                                                                    <br>

                                                                    <div class="d-flex ">         
                                                                        <button type="submit" class="btn btn-danger me-5" name="save">save</button>

                                                                    </div>

                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>         
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!--Update profile enddddd-->


                            <!-- profile end  -->

                            <!-- Servicing start  -->
                            <div class="tab-pane fade " id="servicing">

                                <div class="row my-5">
                                    <h3 class=" mb-3">Next Servicing </h3>
                                    <!--next servicing details table start--> 
                                    <div class="col-md-9">
                                        <table class="table bg-white rounded shadow-sm  table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col" width="150">Today</th>
                                                    <th scope="col">Next Servicing Date</th>
                                                    <th scope="col">Next Servicing KM</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    int uid = user.getUid();
                                                    try {
                                                        Connection con = ConnectionProvider.getCon();
                                                        String q2 = "select next_servicing, next_km from servicing_history where scid=? ORDER BY sid DESC LIMIT 1";
                                                        PreparedStatement pstmt = con.prepareStatement(q2);
                                                        pstmt.setInt(1, uid);
                                                        ResultSet resultSet = pstmt.executeQuery();
                                                        if(resultSet.next()) {
                                                %>
                                                <tr>
                                                    <th scope="row"> 
                                                        <%
                                                            Date currentDate = new Date();
                                                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                                            String dateOnly = dateFormat.format(currentDate);
                                                        %>
                                                        <%= dateOnly%>
                                                    </th>

                                                    <td><%= resultSet.getString("next_servicing")%></td>
                                                    <td><%= resultSet.getString("next_km")%> KM</td>

                                                </tr>

                                                <% }
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>         
                                            </tbody>
                                        </table>
                                    </div>
                                    <!--next servicing details table end--> 
                                   
                                    <!--next servicing booking form start--> 
                                    <div class="col-md-3">
                                        <div class="shadow-sm d-flex justify-content-around align-items-center  bg-success text-dark h-100 d-inline-block">
                                            <div>
                                                <%
                                                    try {
                                                        Connection con = ConnectionProvider.getCon();
                                                        String q = "SELECT * from bike where uid =?";
                                                        PreparedStatement pstmt = con.prepareStatement(q);
                                                        pstmt.setInt(1, uid);
                                                        ResultSet resultSet = pstmt.executeQuery();
                                                        if (resultSet.next()) {
                                                %>
                                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#ServicingBooking">Book Now </button>
                                                <% } else { %>

                                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#bikeform" id="add" >Add New Bike </button>   
                                                <% }

                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %> 
                                            </div>
                                        </div>
                                    </div>

                                    <!--next servicing booking formend--> 
                                </div>
                            
                               <!--online booking details display start-->
                                 <div class="row my-5">
                                    <h3 class=" mb-3">Last Booking Details </h3>
                                    <!--next servicing details table start--> 
                                    <div class="col">
                                                
                                                <table class="table bg-white rounded shadow-sm  table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col"> ID </th> 
                                                    <th scope="col"> Date </th>
                                                    <th scope="col"> Booking Date</th>
                                                    <th scope="col"> Booking Time</th>
                                                    <th scope="col"> Problems </th>
                                                    <th scope="col"> Status </th>
                                                    <th scope="col"> Action </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    
                                                    try {
                                                        Connection con = ConnectionProvider.getCon();
                                                        String q2 = "select * from onlinebooking where uid = ?";
                                                        PreparedStatement pstmt = con.prepareStatement(q2);
                                                        pstmt.setInt(1, uid);
                                                        ResultSet resultSet = pstmt.executeQuery();
                                                        while (resultSet.next()) {
                                                %>
                                            <tr>
                                            <td class="bookingC_id"><%= resultSet.getInt("obid")%></td> 
                                            <td> <%= resultSet.getString("created_at")%> </td>
                                            <td> <%= resultSet.getString("booking_date")%> </td>
                                            <td>  <%= resultSet.getString("booking_time")%>  </td>
                                            <td> <%= resultSet.getString("problems")%> </td>
                                            <td>
                                                    <% OnlinebookingDao onlineBookingDao = new OnlinebookingDao(ConnectionProvider.getCon());
                                                        if (onlineBookingDao.isAccepted(Integer.parseInt(resultSet.getString("obid"))) == null) {%>
                                                       
                                                    <a type="button" class="btn btn-danger btn-sm"> Pending </a>
                                                    <%} else if (onlineBookingDao.isAccepted(Integer.parseInt(resultSet.getString("obid"))).equals("1")) {%>
                                                    <a href="#" type="button" disabled class="btn btn-success btn-sm">Accepted</a>   
                                                    <%
                                                    } else {%>
                                                    <a href="#" type="button" disabled class="btn btn-danger btn-sm">Rejected</a>   
                                                    <%}%>
                                                </td>   
                                                <td> <button type="button" class="btn btn-warning btn-sm booking_id " data-bs-toggle="modal" data-bs-target="#bookingdelete"> Cancel </button></td>
                                            </tr>

                                            <% }
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>         
                                            </tbody>
                                        </table>
                                    </div>
                                    </div>
                                    <!--online booking details display end-->
                                   </div>
                                        <!--booking delete code start-->
                                        <div class="modal fade" id="bookingdelete" tabindex="-1" aria-labelledby="albookingdelete" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="CancelOnlineBookingServ" method="Get"> 
										
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="bookingdelete">Do you want to Cancel?</h5>
                                            <input type="hidden" name="obid" id="pass_ob_id">
                                        
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                             <button type="submit" class="btn btn-danger" >Yes</button>
                                        </div>
                                            </form>
                                    </div>
                                </div>
                            </div>
                                        <!--booking delete code end-->
                                        
                           <!--online booking details  end-->
                            <!-- servicing booking Button trigger modal -->

                            <div class="modal fade" id="ServicingBooking" tabindex="-1" aria-labelledby="ServicingBookingLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-body">
                                            <main class="d-flex align-items-center">
                                                <div class="container">

                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="card" >
                                                                <div class="card-header bg-success text-white text-center"> 
                                                                    <h5 class="d-flex justify-content-center">Book Your Servicing</h5>
                                                                </div>
                                                                <div class="card-body">
                                                                    <!-- booking form start   -->
                                                                    <form action="OnlineBooking" method="POST">

                                                                        <div class="mb-3">
                                                                            <label for="bookdate" class="form-label"><i class="fa fa-calendar"></i> Date</label>
                                                                            <input type = "text" id = "booking" name="online_booking_date" class="form-control" aria-describedby="bookalert" required>
                                                                            <div id="bookalert" class="form-text">Please Don't book for Today .</div>
                                                                            <script>
                                                                                $(document).ready(function () {
                                                                                    $("#booking").datepicker({
                                                                                        dateFormate: "dd-mm-yyy",
                                                                                        minDate: new Date(),
                                                                                        maxDate: "1m"
                                                                                    });
                                                                                })
                                                                            </script>

                                                                        </div>

                                                                         <div class="mb-3">
                                                                            <label for="booking_time" class="form-label"><i class="fa fa-clock-o"></i>Time</label>
<!--                                                                            <input type="time" id="booking_time" name="appt" class="form-control"
                                                                               min="09:00" max="18:00" required>-->
                                                                                <div class="col">
                                                                                                            <select id="UstateInput" class="form-control" name="bookingTime" >
                                                                                                                <option value="10-12 AM">10-12 AM</option>
                                                                                                                <option value="12-2 AM">12-2 AM</option>
                                                                                                                <option value="2-4 PM">2-4 PM</option>
                                                                                                                <option value="4-6 PM">4-6 PM</option>
                                                                                                             
                                                                                                            </select>
                                                                                                        </div> 
                                                                            <div id="emailHelp" class="form-text">Office hours are 9am to 6pm</div>
                                                                          </div>

                                                                        <div class="mb-3">
                                                                            <label for="bike_problems" class="form-label"><i class="fa fa-motorcycle"></i>Bike Problems</label>
                                                                            <textarea  name="bike_problem" rows="4" cols="30" class="form-control text-start"></textarea>
                                                                        </div>
                                                                        <input type="hidden" value="<%= user.getUid()%>" name="uid">
                                                                        <input type="hidden" value="<%= user.getFull_name()%>" name="full_name">
                                                                        <input type="hidden" value="<%= user.getEmail()%>" name="email">
                                                                        <div class="d-flex ">         
                                                                            <button type="submit" class="btn btn-success me-5">Book</button>
                                                                        </div>

                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>         
                                                    </div>

                                                </div>
                                            </main>
                                            <!-- booking form end -->

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Servicing History< start  -->
                            <div class="tab-pane fade " id="ServicingHistory">
                                <!-- <h1>Servicing History</h1> -->
                                <div class="row my-5">
                                    <div class=" my-3 d-flex w-75 h-75 justify-content-start">
                                        <div>
                                             <h3 class=" me-3">Servicing History</h3>
                                        </div>
                                         <div>
                                                                <input
                                                                    type="text"
                                                                    placeholder="Search Here "
                                                                    class="form-control"
                                                                    id="ServHisSerInp"
                                                                    />
                                                                
                                                            </div>
                                    </div>
                                   
                                    <div class="col">
                                        <table class="table bg-white rounded shadow-sm  table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col" width="50">ID</th>
                                                    <th scope="col">Servicing Date</th>
                                                    <th scope="col">KM</th>
                                                    <th scope="col">Amount</th>
                                                    <th scope="col">mechanic ID</th>
                                                    <th scope="col">Parts Changed</th>                                    
                                                </tr>
                                            </thead>
                                            <tbody id='ServHisSertbl'>
                                                <%
                                                     int Total = 0;
                                                     int start = 0, recordCount = 6;
                                                    try {
                                                        int pgno = request.getParameter("pgno") == null ? 0 : Integer.parseInt(request.getParameter("pgno"));
                                                        start = pgno * recordCount;
                                                        Connection con = ConnectionProvider.getCon();
                                                        String q = "SELECT * FROM servicing_history WHERE scid = ? limit ?,?";
                                                        PreparedStatement pstmt = con.prepareStatement(q);
                                                        pstmt.setInt(1, uid);
                                                        pstmt.setInt(2, start);
                                                        pstmt.setInt(3, recordCount);
                                                        ResultSet resultSet = pstmt.executeQuery();
                                                        while (resultSet.next()) {
                                                %>

                                                <tr>
                                                    <th scope="row"><%= resultSet.getString("sid")%></th>
                                                    <td><%= resultSet.getString("servicing_at")%></td>
                                                    <td><%= resultSet.getString("km")%></td>
                                                    <td><%= resultSet.getString("amount")%></td>
                                                    <td><%= resultSet.getString("mid")%></td>     
                                                    <td><%= resultSet.getString("parts_changed")%></td>                              

                                                </tr>
                                                                  <% }
                                                                            String sql = "select count(*) from servicing_history";
                                                                            PreparedStatement stmt1 = con.prepareStatement(sql);
                                                                            ResultSet urs = stmt1.executeQuery();
                                                                            if (urs.next()) {
                                                                                Total = urs.getInt(1);
                                                                            }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        } %>
                                                                    <tr>
                                                                        <th colspan="9">
                                                                            <table>
                                                                                <tr>
                                                                                    <% for (int i = 0; i <= Total / recordCount; i++) {%>
                                                                                    <td>
                                                                                        <a
                                                                                            href="user_dashboard.jsp?pgno=<%= i%>"
                                                                                            class="btn btn-info"
                                                                                            >
                                                                                            Page <%= i + 1%>
                                                                                        </a>
                                                                                    </td>

                                                                                    <% } %>
                                                                                </tr>
                                                                            </table>
                                                                        </th>
                                                                    </tr>
                                               
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                            <!-- Servicing History< end  -->
                            <!-- booking model end
                            -->          <!--User Feed Back Start-->

                            <div class="tab-pane fade " id="UserFeedback">

                                <div class="row">
                                    <div class="col-md-6 offset-md-2">
                                        <!-- maila -->
                                        <div class="card" >
                                            <div class="card-header bg-success text-white">
                                                <h3 >Contact Us</h3>
                                                <p>Please fill this form in a decent manner</p>
                                            </div>
                                            <div class="card-body">
                                                <form action="UserFeedBack" method="POST">
                                                    <div class="mb-3">
                                                        <label class="form-label"><i class="fa fa-user"></i> Full name</label>
                                                        <input type="text" class="form-control" name="ufname" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label"><i class="fa fa-envelope"></i> Email</label>
                                                        <input type="email" class="form-control" name="ufemail" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label  class="form-label"><i class="fa fa-comment"></i> Message</label>
                                                        <textarea class="form-control" rows="4" name="ufmessage">
                                                        </textarea>

                                                    </div>
                                                    <input type="hidden" value="<%= user.getUid()%>" name="uid">

                                                    <div class="d-flex ">         
                                                        <button type="submit" class="btn btn-success me-5 ">Submit</button>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                        <!-- maila -->
                                    </div>         
                                </div>   


                            </div>
                            <!--User Feed Back end--> 
                            
                            <!--User password change start-->
                            <div class="tab-pane fade " id="ChangePass">

                                <div class="row">
                                    <div class="col-md-6 offset-md-2">
                                        <!-- maila -->
                                        <div class="card" >
                                            <div class="card-header bg-success text-white">
                                                <h3 >change password</h3>
                                                
                                            </div>
                                            <div class="card-body">
                                                <form action="UserPassChange" method="POST">
                                                    <div class="mb-3">
                                                        <label class="form-label"><i class="fa fa-unlock"></i> current password</label>
                                                        <input type="password" class="form-control" name="currPass" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label"><i class="fa fa-unlock-alt"></i> new password</label>
                                                        <input type="password" class="form-control"  id="txtNewPassword"  name="newpass"required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label  class="form-label"><i class="fa fa-lock"></i> confirm  password</label>
                                                         <input type="password" class="form-control" id="txtConfirmPassword" name="confpass" required>

                                                    </div>
                                                    <div class="registrationFormAlert"  id="CheckPasswordMatch"> </div>
                                                    <br>
                                                    <input type="hidden" value="<%= user.getUid()%>" name="uid">

                                                    <div class="d-flex ">         
                                                        <button type="submit" class="btn btn-success me-5 ">Submit</button>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                        <!-- maila -->
                                    </div>         
                                </div>   


                            </div>
                            <!--user password change end-->

                         
                            <!-- my bike start   -->
                            <div class="tab-pane fade " id="Bike">

                                <div class="container-fluid mt-5">

                                    <div class="row ms-4">
                                        <!--                                        <div class="row">-->
                                        <div class="card mb-3" style="max-width: 740px;">
                                            <div class="row g-0">
                                                <%
                                                    try {
                                                        Connection con = ConnectionProvider.getCon();
                                                        String q = "SELECT * from bike where uid =?";
                                                        PreparedStatement pstmt = con.prepareStatement(q);
                                                        pstmt.setInt(1, uid);
                                                        ResultSet bike = pstmt.executeQuery();
                                                        if (bike.next()) {
                                                %>
                                                <div class="col-md-4 p-4">
                                                    <div class="row">
                                                        <img src="Bike_img/<%= bike.getString("bike_img")%>" class="img-fluid rounded-start img-thumbnail" alt="..." style="width:200px; height: 200px;">
                                                    </div>
                                                    <div class="row">

                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <h3 class="card-title ">Basic Info</h3>  
                                                        </div>

                                                    </div>

                                                    <div class="card-body">

                                                        <div class="row d-flex justify-content-between">
                                                            <div class="col">
                                                                <h6>Company:</h6>  
                                                            </div>
                                                            <div class="col">
                                                                <p> <%= bike.getString("company")%></p>  
                                                            </div>
                                                        </div>
                                                        <div class="row d-flex justify-content-between">
                                                            <div class="col">
                                                                <h6>Model:</h6>  
                                                            </div>
                                                            <div class="col">
                                                                <p><%= bike.getString("model")%> </p>  
                                                            </div>
                                                        </div>
                                                        <div class="row d-flex justify-content-between">
                                                            <div class="col">
                                                                <h6>Color:</h6>  
                                                            </div>
                                                            <div class="col">
                                                                <p> <%= bike.getString("color")%> </p>  
                                                            </div>
                                                        </div>
                                                        <div class="row d-flex justify-content-between">
                                                            <div class="col">
                                                                <h6>Bike Number:</h6>  
                                                            </div>
                                                            <div class="col">
                                                                <p> <%= bike.getString("bike_num")%> </p>  
                                                            </div>
                                                        </div>

                                                        <div class="row d-flex justify-content-between">
                                                            <div class="col">
                                                                <h6>Register Date: </h6>  
                                                            </div>
                                                            <div class="col">
                                                                <p> <%= bike.getString("created_at")%> </p>  
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <br> 
                                                        <div class="d-flex justify-content-end">
                                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#bikeupdateform" id="update">
                                                                Update
                                                            </button>
                                                        </div>

                                                    </div>
                                                    <div class="modal fade" id="bikeupdateform" tabindex="-1" aria-labelledby="bikeupdateformLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-body">

                                                                    <div class="container">
                                                                        <div class="row">
                                                                            <div class="col mx-auto">
                                                                                <div class="card" >
                                                                                    <div class="card-header bg-success text-white text-center">
                                                                                        <h5 class="d-flex justify-content-center"> My Bike</h5>

                                                                                    </div>
                                                                                    <div class="card-body">
                                                                                        <!--?####FORM-->
                                                                                        <form action="BikeUpdate" method="POST" enctype="multipart/form-data">

                                                                                          <div class="row">
                                                                                            <div class="col">
                                                                                                    <label  class="form-label">Company*</label>
                                                                                                    <select class="form-control" id="input" onchange="bike_company()" value='<%= bike.getString("company")%>' name="company" required >
                                                                                                        <option value='<%= bike.getString("company")%>'><%= bike.getString("company")%></option>
                                                                                                        <option value="Bajaj">Bajaj</option>
                                                                                                        <option value="Yamaha">Yamaha</option>
                                                                                                        <option value="TVS">TVS</option>
                                                                                                    </select>
                                                                                                </div>
                                                                                                <div class="col">
                                                                                                    <label  class="form-label">Model*</label>
                                                                                                    <select placeholder='<%= bike.getString("model")%>'  id="output" class="form-control" onchange="bike_company1()"   name="model" required > </select>
                                                                                                </div>
                                                                                            </div>
                                                                                            <br>
                                                                                            <div class="row">
                                                                                                <div class="col">
                                                                                                    <label  class="form-label">Picture</label>
                                                                                                    <input type="file" class="form-control"  name="update_bike_img" value='<%= bike.getString("bike_img")%>' required>
                                                                                                </div>
                                                                                                <div class="col">
                                                                                                    <label  class="form-label">Color*</label>
                                                                                                    <input type="text" class="form-control" value='<%= bike.getString("color")%>' name="color" required>
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
                                                                                                    <input type="text" class="form-control" value='<%= bike.getString("bike_num")%>' name="bike_number" id="UbikeNum" required>
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
                                                                                            <input type="hidden"  name="bid" value='<%= bike.getString("bid")%>'>
                                                                                            <div class="d-flex ">         
                                                                                                <button type="submit" class="btn btn-danger me-5" name="submit">Submit</button>
                                                                                            </div>

                                                                                        </form>
                                                                                    </div>
                                                                                </div>
                                                                            </div>         
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>  


                                                    <% } else { %>
                                                    <br>
                                                    <br>
                                                    <div  class="text-center">
                                                        <h3>No bike details found </h3>
                                                        <div class="row">
                                                            <div class="col d-flex justify-content-end"> 
                                                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#bikeform" id="add" >Add New Bike </button>                                                                         
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <% }

                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }
                                                    %> 



                                                </div>
                                            </div>
                                            <!--                                                if bike not register  start     -->

                                            <!--                                             if bike not register end-->
                                        </div>
                                        <!--                                        </div>-->




                                    </div>  
                                </div>

                                <!-- details end and update button stary -->

                                <!-- add and update forma start -->

                                <!-- dd and update Modal -->
                                <div class="modal fade" id="bikeform" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-body">

                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col mx-auto">
                                                            <div class="card" >
                                                                <div class="card-header bg-success text-white text-center">
                                                                    <h5 class="d-flex justify-content-center"> My Bike</h5>

                                                                </div>
                                                                <div class="card-body">
                                                                    <!--bike form validation-->
                                                                    <script type="text/javascript">
                                                                        // Defining a function to display error message
                                                                        function printError(elemId, hintMsg) {
                                                                            document.getElementById(elemId).innerHTML = hintMsg;
                                                                        }

                                                                        // Defining a function to validate form 
                                                                        function BikeFormValid() {
                                                                            var bikeNum = document.BikeForm.bike_number.value;
                                                                            var BikeErr = true;
                                                                            // bike num validation
                                                                            if (bikeNum == "") {
                                                                                printError("BikeErr", "Please enter bike number ");
                                                                            } else {
                                                                                var re1 = /^[a-zA-Z]{2} [0-9]{2}( )[a-zA-Z]{2} [0-9]{3}/g;
                                                                                var re2 = /^[0-9]{2} [0-9]{3}( )[a-zA-Z]{2}( )[0-9]{3}/g;
                                                                                var res = re1.test(oldbike) || re2.test(stateBike);

                                                                                if (res.test(bikeNum) === false) {
                                                                                    printError("BikeErr", "Please enter bike number like example");
                                                                                } else {
                                                                                    printError("BikeErr", "");
                                                                                    BikeErr = false;
                                                                                }
                                                                            }
                                                                        }
                                                                        ;

                                                                    </script>       
                                                                    <!--?####FORM-->
                                                                    <form onsubmit="return BikeFormValid()" action="BikeRegister" method="POST" enctype="multipart/form-data">

                                                                        <div class="row">
                                                                            <div class="col">
                                                                                <label  class="form-label">Company*</label>
                                                                                <select class="form-control" id="input" onchange="bike_company()" name="company" required >
                                                                                    <option>select Company</option>
                                                                                    <option value="Bajaj">Bajaj</option>
                                                                                    <option value="Yamaha">Yamaha</option>
                                                                                    <option value="TVS">TVS</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="col">
                                                                                <label  class="form-label">Model*</label>
                                                                                <select id="output" class="form-control" onchange="bike_company1()" name="model" required > </select>
                                                                            </div>
                                                                        </div>
                                                                        <br>
                                                                        <div class="row">
                                                                            <div class="col">
                                                                                <label  class="form-label">Picture</label>
                                                                                <input type="file" class="form-control"  name="bike_img" required>
                                                                            </div>
                                                                            <div class="col">
                                                                                <label  class="form-label">Color*</label>
                                                                                <input type="text" class="form-control" placeholder="Red" name="color" required>
                                                                            </div>
                                                                        </div>

                                                                        <br>
<!--                                                                        // bike type check -->
                                                                        <script type="text/javascript">
                                                                            function ShowHideBikeNum(chkStateBike) {
                                                                                var stateBike = document.getElementById("stateBike");
                                                           
                                                                                stateBike.style.display = chkStateBike.checked ? "block" : "none";
                                                                                stateBike.attributes.required = chkStateBike.checked ? "required" : "";
                                                                                // default bike hidike
                                                                                var DefaultBikNum = document.getElementById("DefaultBikNum");
                                                                                var bikeNum = document.getElementById('bikeNum');
                                                                                

                                                                                bikeNum.placeholder = chkStateBike.checked ? "01 001 PA 1010" : "BA 34 PA 359";
                                                                                var staste = document.getElementById("stateInput");
                                                                                var stateValue = staste.options[select.selectedIndex].value;
                                                                                
                                                                                var bothBikeNum = document.getElementById("bikeNum").value;
                                                                                document.getElementById("oldbike").value = chkStateBike.checked ?"stateValue" + " " + "bothBikeNum"  : "bothBikeNum";
                                                                                                                                        
                                                                            }   
                                                                        </script>
                                                                        <div class="row">
                                                                            <div class="col" id="DefaultBikNum">
                                                                                <label  class="form-label">Bike Number*</label>
                                                                                <input type="text" class="form-control" placeholder="BA 34 PA 359" name="bike_number" id="bikeNum" required>
<!--                                                                                <input type="text" class="form-control" style="display:none;" name="bike_number_final" id="bikeNumFinal">-->

                                                                                <span class="error text-danger font-weight-bold" id="BikeErr"></span>
                                                                            </div>
                                                                        </div> 
                                                                        <div class="row">
                                                                            <div class="col">
                                                                                <label for="chkStateBike" class="form-label">
                                                                                    <input type="checkbox" name="checkbx" id="chkStateBike" onclick="ShowHideBikeNum(this)" />
                                                                                    New Bike Number System (STATE 3 01 001 PA 1010)
                                                                                </label>
                                                                                <div id="stateBike" style="display: none" class="row">
                                                                                    <div class="col">
                                                                                        <select id="stateInput" class="form-control" name="stateInput" >
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

                                                                        <div class="d-flex ">         
                                                                            <button type="submit" class="btn btn-danger me-5" name="submit">Submit</button>
                                                                        </div>

                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>         
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- my bike end  -->

                            <!--                             Servicing History< start  
                                                        <div class="tab-pane fade " id="ServicingHistory">
                                                             <h1>Servicing History</h1> 
                                                            <div class="row my-5">
                                                                <h3 class=" mb-3">Servicing History</h3>
                                                                <div class="col">
                                                                    <table class="table bg-white rounded shadow-sm  table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col" width="50">ID</th>
                                                                                <th scope="col">Servicing Date</th>
                                                                                <th scope="col">KM</th>
                                                                                <th scope="col">Amount</th>
                                                                                <th scope="col">mechanic ID</th>
                                                                                <th scope="col">Parts Changed</th>                                    
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                            <%--             <%    
                                 try{           
                                Connection con = ConnectionProvider.getCon();
                                String q = "SELECT s.sid, s.servicing_at, s.km , s.amount, m.full_name,  s.parts_changed FROM servicing_history s INNER JOIN  Mechanic m ON s.mid= m.mid WHERE s.uid = ?";
                                PreparedStatement pstmt = con.prepareStatement(q);
                                pstmt.setInt(1, uid);
                                ResultSet resultSet = pstmt.executeQuery();
                                while (resultSet.next()) {
//                                 %>
                                             
                                             <tr>
                                                 <th scope="row"><%= resultSet.getString("sid") %></th>
                                                 <td><%= resultSet.getString("servicing_at") %></td>
                                                 <td><%= resultSet.getString("km") %></td>
                                                 <td><%= resultSet.getString("amount") %></td>
                                                 <td><%= resultSet.getString("full_name") %></td>     
                                                 <td><%= resultSet.getString("parts_changed") %></td>                              

                                                </tr>
                                                
                                             <% }
                                    } catch (Exception e){
                                    e.printStackTrace();
                                    }
                                 %>                   
                            --%>
                                           </tbody>
                                       </table>
                                   </div>
                               </div>

                           </div>
  Servicing History< end  -->
                            <!--  User Feed Back Start
                                                                                    
                                <div class="tab-pane fade " id="UserFeedback">
                                                 
                                    <div class="row">
                                 <div class="col-md-6 offset-md-2">
                                   maila 
                                   <div class="card" >
                                       <div class="card-header bg-success text-white">
                                           <h3 >Contact Us</h3>
                                           <p>Please fill this form in a decent manner</p>
                                        </div>
                                  <div class="card-body">
                                      <form action="UserFeedBack" method="POST">
                                <div class="mb-3">
                                <label class="form-label"><i class="fa fa-user"></i> Full name</label>
                                <input type="text" class="form-control" name="ufname" required>
                              </div>
                              <div class="mb-3">
                                <label class="form-label"><i class="fa fa-envelope"></i> Email</label>
                                <input type="email" class="form-control" name="ufemail" required>
                              </div>
                              <div class="mb-3">
                                <label  class="form-label"><i class="fa fa-comment"></i> Message</label>
                                <textarea class="form-control" rows="4" name="ufmessage">
                                </textarea>
                            
                              </div>
                                 <input type="hidden" value="" name="uid">
                            
                                    <div class="d-flex ">         
                              <button type="submit" class="btn btn-success me-5 ">Submit</button>
                                    </div>
                                
                            </form>
                              </div>
                            </div>
                             maila 
                              </div>         
                             </div>   
                                    
                                           
                                       </div>
                                           User Feed Back end-->
                            <!-- logout  start  -->
                            <div class="modal fade" id="logout" tabindex="-1" aria-labelledby="logout" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="logout">Do you want to Logout?</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <a type="button" class="btn btn-danger" href="logout">Logout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--logout end-->

                        </div>
                    </div>
                    <!-- right side contain dispaly end  -->
                </div>

            </div> 
            <!--container row end-->                                           
        </div>                
        <!--        </div>
            </div>
        </div>-->


        <script>
             function checkPasswordMatch() {
        var password = $("#txtNewPassword").val();
        var confirmPassword = $("#txtConfirmPassword").val();
        if (password !== confirmPassword)
            $("#CheckPasswordMatch").html("Passwords does not match!!").css("color","red");
        else
            $("#CheckPasswordMatch").html("Passwords match.").css("color","green");
    }
            
             $(document).ready(function () {
//                 check new and confirm password
                         $("#txtConfirmPassword").keyup(checkPasswordMatch);

                             
//                             search jqury code for servicing history  table 
                                          $('#ServHisSerInp').on("keyup", function(){
                                              var serHvalue = $(this).val().toLowerCase();
                                               $('#ServHisSertbl  tr').filter(function(){
                                                  $(this).toggle($(this).text().toLowerCase().indexOf(serHvalue)> -1); 
                                               });
                                          });
                                          
//                                 cancel jqury code
                                    
                                     $('.booking_id').click(function (e){
                                             e.preventDefault();
                                             
                                             var b_id = $(this).closest('tr').find('.bookingC_id').text();
                                             
                                             $('#pass_ob_id').val(b_id);
                                             $('#bookingdelete').modal('show');
                                         
                                         });
                                    
            });
        </script>






        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                                                                        var el = document.getElementById("wrapper");
                                                                                        var toggleButton = document.getElementById("menu-toggle");

                                                                                        toggleButton.onclick = function () {
                                                                                            el.classList.toggle("toggled");
                                                                                        };
        </script>
    </body>

</html>