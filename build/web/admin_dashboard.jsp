<%@page import="com.bikesewa.dao.OnlinebookingDao"%> <%@page
    import="java.sql.PreparedStatement"%> <%@page
        import="com.bikesewa.entities.Message"%> <%@page
            import="com.bikesewa.entities.Admin"%> <%@page import="java.sql.Statement"%>
            <%@page import="java.sql.ResultSet"%> <%@page
                import="com.bikesewa.helper.ConnectionProvider"%> <%@page
                import="java.sql.Connection"%> <% Admin admin = (Admin) session.getAttribute("currentAdmin");
                    if (admin == null) {
                        response.sendRedirect("admin.jsp");
                    } %> <%@page contentType="text/html"
                               pageEncoding="UTF-8"%>

                    <!DOCTYPE html>
                    <html lang="en">
                        <head>
                            <meta charset="UTF-8" />
                            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                            <link
                                href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
                                rel="stylesheet"
                                />
                            <!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" /> -->
                            <link
                                rel="stylesheet"
                                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
                                />
                            <style>
                                .btn:focus{
                                    box-shadow: none !important;
                                }
                                .customNav > .btn.active{
                                    background-color: black !important;
                                    color: white !important;
                                }
                           
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
                            
                            <title>admin dashboard</title>
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

                        <body class="bg-light">
                            <div class="d-flex justify-content-center">
                                <% Message m = (Message) session.getAttribute("msg");
                                    if (m != null) {%>
                                <div class="alert <%= m.getCssClass()%>" role="alert">
                                    <%= m.getContent()%>
                                </div>
                                <% session.removeAttribute("msg");
                                    } %>
                            </div>

                            <div class="container-fluid">
                                <div class="row pt-2">

                                    <!-- left side navbar start  -->
                                    <div class="col-lg-3 col-md-4 d-md-block">
                                        <div class="card card-left bg-light text-white" style="height: 100vh">
                                            <nav class="navbar navbar-light bg-light">
                                                <div class="container-fluid">
                                                    <a class="navbar-brand" href="#" style="font-size:2rem; color:white; text-shadow: 2px 2px 8px #FF0000;">
                                                        Bike Sewa
                                                    </a>
                                                </div>
                                            </nav>
                                            <div class="card-body">
                                                <div
                                                    class="nav customNav flex-column align-items-start nav-pills me-md-3 mb-3 mb-md-0"
                                                    id="v-pills-tab"
                                                    role="tablist"
                                                    aria-orientation="vertical"
                                                    >
                                                    <button
                                                        class="btn mb-3"
                                                        id="v-pills-dashboard-tab"
                                                        data-bs-toggle="pill"
                                                        data-bs-target="#v-pills-dashboard"
                                                        type="button"
                                                        role="tab"
                                                        aria-controls="v-pills-dashboard"
                                                        aria-selected="true"
                                                        > <i class="fa fa-dashboard me-2" style="font-size: 36px"></i>
                                                        Dashboard
                                                    </button>
                                                    <button
                                                        class="btn mb-3"
                                                        id="v-pills-customer-tab"
                                                        data-bs-toggle="pill"
                                                        data-bs-target="#v-pills-customer"
                                                        type="button"
                                                        role="tab"
                                                        aria-controls="v-pills-customer"
                                                        aria-selected="false"
                                                        ><i class="fas fa fa-group me-2" style="font-size: 24px"></i>
                                                        Customers
                                                    </button>
                                                    <button
                                                        class="btn mb-3"
                                                        id="v-pills-online-booking-tab"
                                                        data-bs-toggle="pill"
                                                        data-bs-target="#v-pills-online-booking"
                                                        type="button"
                                                        role="tab"
                                                        aria-controls="v-pills-online-booking"
                                                        aria-selected="false"
                                                        > <i
                                                            class="fa fa-calendar-check-o me-2"
                                                            style="font-size: 24px"
                                                            ></i>
                                                        Online Booking
                                                    </button>
                                                    <button
                                                        class="btn mb-3"
                                                        id="v-pills-bikes-tab"
                                                        data-bs-toggle="pill"
                                                        data-bs-target="#v-pills-bikes"
                                                        type="button"
                                                        role="tab"
                                                        aria-controls="v-pills-bikes"
                                                        aria-selected="false"
                                                        > <i class="fas fa fa-motorcycle me-2" style="font-size: 24px"></i
                                                        >
                                                        Bikes
                                                    </button>
                                                    <button
                                                        class="btn mb-3"
                                                        id="v-pills-servicing-history-tab"
                                                        data-bs-toggle="pill"
                                                        data-bs-target="#v-pills-servicing-history"
                                                        type="button"
                                                        role="tab"
                                                        aria-controls="v-pills-servicing-history"
                                                        aria-selected="false"
                                                        ><i class="fa fa-gears me-2" style="font-size: 24px"></i>
                                                        Servicing History
                                                    </button>
                                                    <button
                                                        class="btn mb-3"
                                                        id="v-pills-feedback-tab"
                                                        data-bs-toggle="pill"
                                                        data-bs-target="#v-pills-feedback"
                                                        type="button"
                                                        role="tab"
                                                        aria-controls="v-pills-feedback"
                                                        aria-selected="false"
                                                        > <i class="fa fa-envelope me-2" style="font-size: 24px"></i>
                                                        Feedback
                                                    </button>
                                                    <button
                                                        class="btn mb-3"
                                                        id="v-pills-mechanics-tab"
                                                        data-bs-toggle="pill"
                                                        data-bs-target="#v-pills-mechanics"
                                                        type="button"
                                                        role="tab"
                                                        aria-controls="v-pills-mechanics"
                                                        aria-selected="false"
                                                        ><i class="fa fa-wrench me-2" style="font-size: 24px"></i>
                                                        Mechanics
                                                    </button>
                                                    <button
                                                        class="btn mb-3"
                                                        id="v-pills-admin-tab"
                                                        data-bs-toggle="pill"
                                                        data-bs-target="#v-pills-admin"
                                                        type="button"
                                                        role="tab"
                                                        aria-controls="v-pills-admin"
                                                        aria-selected="false"
                                                        ><i class="fa fa fa-user me-2" style="font-size: 24px"></i>
                                                        Admin
                                                    </button>
                                                    <div class="row">
                                                        <div
                                                            class="col align-text-bottom d-flex justify-content-center"
                                                            >
                                                            <button
                                                                type="button"
                                                                class="btn btn-danger"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#logout"
                                                                >
                                                                <i
                                                                    class="fas fa fa-power-off me-2"
                                                                    style="font-size: 24px"
                                                                    ></i
                                                                >Logout
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end here-->                                            
                                        </div>
                                    </div>

                                    <div class="col-lg-9">
                                        <!-- right side contain dispaly start  -->
                                        <div
                                            class="card-body tab-content bg-light text-whit"
                                            style="height: 90vh"
                                            >
                                            <div class="tab-content" id="v-pills-tabContent">

                                                <!--Dashboard started-->
                                                <div
                                                    class="tab-pane fade show active"
                                                    id="v-pills-dashboard"
                                                    role="tabpanel"
                                                    aria-labelledby="v-pills-dashboard-tab"
                                                    >
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div
                                                                class="shadow-sm d-flex justify-content-around align-items-center m-2 bg-success text-dark"
                                                                >
                                                                <div>
                                                                    <% try {
                                                                            Connection con = ConnectionProvider.getCon();
                                                                            Statement statement = con.createStatement();
                                                                            String q
                                                                                    = "SELECT COUNT(uid) FROM user";
                                                                            ResultSet resultSet
                                                                                    = statement.executeQuery(q);
                                                                            while (resultSet.next()) {%>
                                                                    <h5 class="fs-2 mx-5">
                                                                        <%= resultSet.getString("COUNT(uid)")%>
                                                                    </h5>
                                                                    <% }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        } %>
                                                                    <span class="fs-2 text-white h6"> Customers</span>
                                                                </div>

                                                                <i class="fa fa-users" style="font-size: 36px"></i>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div
                                                                class="shadow-sm d-flex justify-content-around align-items-center m-2 bg-success text-dark"
                                                                >
                                                                <div>
                                                                    <% try {
                                                                            Connection con = ConnectionProvider.getCon();
                                                                            Statement statement = con.createStatement();
                                                                            String q
                                                                                    = "SELECT COUNT(obid) FROM onlinebooking";
                                                                            ResultSet resultSet = statement.executeQuery(q);
                                                                            while (resultSet.next()) {%>
                                                                    <h5 class="fs-2 mx-5">
                                                                        <%= resultSet.getString("COUNT(obid)")%>
                                                                    </h5>
                                                                    <% }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        } %>
                                                                    <span class="fs-2 text-white h6"> Online Booking</span>
                                                                </div>
                                                                <i
                                                                    class="fa fa-calendar-plus-o"
                                                                    style="font-size: 36px"
                                                                    ></i>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <div
                                                                class="shadow-sm d-flex justify-content-around align-items-center m-2 bg-success text-dark"
                                                                >
                                                                <div>
                                                                    <% try {
                                                                            Connection con = ConnectionProvider.getCon();
                                                                            Statement statement = con.createStatement();
                                                                            String q
                                                                                    = "SELECT COUNT(bid) FROM bike";
                                                                            ResultSet resultSet
                                                                                    = statement.executeQuery(q);
                                                                            while (resultSet.next()) {%>
                                                                    <h3 class="fs-2 mx-5">
                                                                        <%= resultSet.getString("COUNT(bid)")%>
                                                                    </h3>
                                                                    <% }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        } %>

                                                                    <span class="fs-2 text-white h6"> Total Bikes</span>
                                                                </div>

                                                                <i class="fa fa-motorcycle" style="font-size: 36px"></i>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <div
                                                                class="shadow-sm d-flex justify-content-around align-items-center m-2 bg-danger text-dark"
                                                                >
                                                                <div>
                                                                    <% try {
                                                                            Connection con = ConnectionProvider.getCon();
                                                                            Statement statement = con.createStatement();
                                                                            String q
                                                                                    = "SELECT COUNT(mid) FROM Mechanic";
                                                                            ResultSet resultSet
                                                                                    = statement.executeQuery(q);
                                                                            while (resultSet.next()) {%>
                                                                    <h5 class="fs-2 mx-5">
                                                                        <%= resultSet.getString("COUNT(mid)")%>
                                                                    </h5>
                                                                    <% }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        } %>

                                                                    <h3 class="fs-2 text-white">Mechanics</h3>
                                                                </div>
                                                                <i class="fa fa-user" style="font-size: 36px"></i>
                                                            </div>
                                                        </div>
                                                        <!--admin  and confirm bookin start-->
                                                        <div class="col-md-4">
                                                            <div
                                                                class="shadow-sm d-flex justify-content-around align-items-center m-2 bg-danger text-dark"
                                                                >
                                                                <div>
                                                                    <% try {
                                                                            Connection con = ConnectionProvider.getCon();
                                                                            Statement statement = con.createStatement();
                                                                            String q
                                                                                    = "SELECT COUNT(booking_status) FROM onlinebooking where booking_status = '1' ";
                                                                            ResultSet rs = statement.executeQuery(q);
                                                                            while (rs.next()) {%>
                                                                    <h5 class="fs-2 mx-5">
                                                                        <%= rs.getString("COUNT(booking_status)")%>
                                                                    </h5>
                                                                    <% }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        } %>

                                                                    <span class="fs-2 text-white h6">Accepted Booking</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <div
                                                                class="shadow-sm d-flex justify-content-around align-items-center m-2 bg-danger text-dark"
                                                                >
                                                                <div>
                                                                    <% try {
                                                                            Connection con = ConnectionProvider.getCon();
                                                                            Statement statement = con.createStatement();
                                                                            String q
                                                                                    = "SELECT COUNT(aid) FROM admin";
                                                                            ResultSet resultSet
                                                                                    = statement.executeQuery(q);
                                                                            while (resultSet.next()) {%>
                                                                    <h5 class="fs-2 mx-5">
                                                                        <%= resultSet.getString("COUNT(aid)")%>
                                                                    </h5>
                                                                    <% }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        } %>

                                                                    <span class="fs-2 text-white h6"> Admin</span>
                                                                </div>
                                                                <i class="fa fa-user-circle-o" style="font-size: 36px"></i>
                                                            </div>
                                                        </div>

                                                        <!--admin and confirm bookinr end-->
                                                    </div>
                                                    <!-- accepted booking dashboard -->
                                                    <div class="mt-3  d-flex w-75 h-75 justify-content-start">
                                                        <div>
                                                         <h4 class=" fw-bolder me-3 align-top">Accepted Booking</h4>
                                                    </div>
                                                        <div>
                                                                <input
                                                                    type="text"
                                                                    placeholder="Search Here "
                                                                    class="form-control  h-76"
                                                                    id="acbSerInp"
                                                                    />
                                                                
                                                            </div>
                                                    </div>
                                                    
                                                    <br />
                                                    <div class="row">
                                                        <table
                                                            class="table bg-white rounded shadow-sm table-hover table-responsive"
                                                            >
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">ID</th>
                                                                    <th scope="col">Date</th>
                                                                    <th scope="col">Name</th>
                                                                    <th scope="col">Bike Num</th>
                                                                    <th scope="col">Booking Date</th>
                                                                    <th scope="col">Email</th>
                                                                    <th scope="col">Problem</th>
                                                                    <th scope="col">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id='acbSertbl'>
                                                                <%
                                                                    int dabTotal = 0;
                                                                        int dabstart = 0, dabrecordCount = 2;
                                                                    try {
                                                                         int dabpgno = request.getParameter("dabpgno") == null ? 0 : Integer.parseInt(request.getParameter("dabpgno"));
                                                                            dabstart = dabpgno * dabrecordCount;
                                                                        Connection con = ConnectionProvider.getCon();
                                                                        Statement statement = con.createStatement();
                                                                        String q = "SELECT * FROM onlinebooking where booking_status = '1' ORDER BY obid DESC limit ?,?";
                                                                        PreparedStatement stmt = con.prepareStatement(q);
                                                                            stmt.setInt(1, dabstart);
                                                                            stmt.setInt(2, dabrecordCount);
                                                                        ResultSet resultSet = stmt.executeQuery();
                                                                        while (resultSet.next()) {%>
                                                                <tr>
                                                                    <td><%= resultSet.getString("obid")%></td>
                                                                    <td><%= resultSet.getString("created_at")%></td>
                                                                    <td><%= resultSet.getString("c_name")%></td>
                                                                    <td><%= resultSet.getString("bike_num")%></td>
                                                                    <td>
                                                                        <%= resultSet.getString("booking_date")%> <br />
                                                                        <%= resultSet.getString("booking_time")%>
                                                                    </td>
                                                                    <td><%= resultSet.getString("c_email")%></td>
                                                                    <td><%= resultSet.getString("problems")%></td>

                                                                    <td>
                                                                        <a
                                                                            href="OBservicingHistory.jsp?uid=<%= resultSet.getString("uid"
                                                                            )%>"
                                                                            type="button"
                                                                            class="btn btn-warning btn-sm"
                                                                            >Update</a
                                                                        >
                                                                    </td>
                                                                </tr>
                                                                <% }
                                                                            String sql = "select count(*) from onlinebooking";
                                                                            PreparedStatement stmt1 = con.prepareStatement(sql);
                                                                            ResultSet dab = stmt1.executeQuery();
                                                                            if (dab.next()) {
                                                                                dabTotal = dab.getInt(1);
                                                                            }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        } %>
                                                                    <tr>
                                                                        <th colspan="9">
                                                                            <table>
                                                                                <tr>
                                                                                    <% for (int i = 0; i <= dabTotal / dabrecordCount; i++) {%>
                                                                                    <td>
                                                                                        <a
                                                                                            href="admin_dashboard.jsp?dabpgno=<%= i%>"
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
                                                    <!--dashboard end-->


                                                </div>

                                                <!--Customers started-->
                                                <div
                                                    class="tab-pane fade"
                                                    id="v-pills-customer"
                                                    role="tabpanel"
                                                    aria-labelledby="v-pills-customer-tab"
                                                    >
                                                    <div class="row">
                                                        <h3 class="mb-3">Customers</h3>
                                                        <div class="mb-3 my-3 d-flex w-75 h-75 justify-content-start">
                                                            <!-- // add update delete start -->
                                                            <div>
                                                                <button
                                                                type="button"
                                                                class="btn btn-success me-2"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#addCustomer"
                                                                >
                                                                Add New
                                                            </button>
                                                            </div>
                                                            <div>
                                                             <input
                                                                    type="text"
                                                                    placeholder="Search Here"
                                                                    class="form-control"
                                                                    name="custSearch"
                                                                    id="cusSerInput"
                                                                    />
                                                            
                                                                </div>
                                                            <!--  customer Button trigger modal  start-->

                                                            <div
                                                                class="modal fade"
                                                                id="addCustomer"
                                                                tabindex="-1"
                                                                aria-labelledby="addCustomerlevel"
                                                                aria-hidden="true"
                                                                >
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body">
                                                                            <!-- form start -->
                                                                            <div class="card">
                                                                                <div
                                                                                    class="card-header bg-success text-white text-center"
                                                                                    >
                                                                                    <h4 class="d-flex justify-content-center">
                                                                                        Add Customer
                                                                                    </h4>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                    <!--FORM-->
                                                                                    <form
                                                                                        action="AddCustomer"
                                                                                        method="POST"
                                                                                        enctype="multipart/form-data"
                                                                                        >
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    placeholder="Full Name"
                                                                                                    name="user_name"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="email"
                                                                                                    class="form-control"
                                                                                                    placeholder="Email"
                                                                                                    name="user_email"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="number"
                                                                                                    class="form-control"
                                                                                                    placeholder="Phone"
                                                                                                    name="user_phone"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <div class="col">
                                                                                                    <label
                                                                                                        class="visually-hidden"
                                                                                                        for="autoSizingSelect"
                                                                                                        ></label>
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
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="password"
                                                                                                    class="form-control"
                                                                                                    name="user_password"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    placeholder="Address"
                                                                                                    name="user_address"
                                                                                                    required
                                                                                                    />
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
                                                                            </div>
                                                                            <!-- add  form end -->
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button
                                                                                type="button"
                                                                                class="btn btn-secondary"
                                                                                data-bs-dismiss="modal"
                                                                                >
                                                                                Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Add Mechanic Button trigger modal  end-->
                                                            <!-- Update Mechanic Button trigger modal  start-->
<!--                                                            <div
                                                                class="modal fade"
                                                                id="updateCustomer"
                                                                tabindex="-1"
                                                                aria-labelledby="updateCustomerlevel"
                                                                aria-hidden="true"
                                                                >
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body">
                                                                             form start 
                                                                            <div class="card">
                                                                                <div
                                                                                    class="card-header bg-success text-white text-center"
                                                                                    >
                                                                                    <h4 class="d-flex justify-content-center">
                                                                                        Update Customer
                                                                                    </h4>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                    ?####FORM
                                                                                    <form
                                                                                        action="Register"
                                                                                        method="POST"
                                                                                        enctype="multipart/form-data"
                                                                                        >
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    placeholder="Full Name"
                                                                                                    name="full_name"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="email"
                                                                                                    class="form-control"
                                                                                                    placeholder="Email"
                                                                                                    name="email"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="number"
                                                                                                    class="form-control"
                                                                                                    placeholder="Phone"
                                                                                                    name="phone"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <div class="col">
                                                                                                    <label
                                                                                                        class="visually-hidden"
                                                                                                        for="autoSizingSelect"
                                                                                                        ></label>
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
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="file"
                                                                                                    class="form-control"
                                                                                                    name="photo"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    placeholder="Address"
                                                                                                    name="address"
                                                                                                    required
                                                                                                    />
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
                                                                            </div>-->

                                                                            <!-- updating form end -->
<!--                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button
                                                                                type="button"
                                                                                class="btn btn-secondary"
                                                                                data-bs-dismiss="modal"
                                                                                >
                                                                                Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>-->
                                                                                           
                                                        </div>
                                                        <br />
                                                        <div class="col">
                                                            <table
                                                                class="table bg-white rounded shadow-sm table-hover table-responsive"
                                                                >
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">ID</th>
                                                                        <th scope="col">Register Date</th>
                                                                        <th scope="col">Name</th>
                                                                        <th scope="col">Image</th>
                                                                        <th scope="col">Phone</th>
                                                                        <th scope="col">Email</th>
                                                                        <th scope="col">Gender</th>
                                                                        <th scope="col">Address</th>
                                                                        <th scope="col">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="cusSertbl">
                                                                    <% int Total = 0;
                                                                        int start = 0, recordCount = 6;
                                                                        try {
                                                                            int pgno = request.getParameter("pgno") == null ? 0
                                                                                    : Integer.parseInt(request.getParameter("pgno"));
                                                                            start
                                                                                    = pgno * recordCount;
                                                                            Connection con
                                                                                    = ConnectionProvider.getCon();
                                                                            Statement statement
                                                                                    = con.createStatement();
                                                                            String q = "select * from user  ORDER BY uid DESC limit ?,?";
                                                                            PreparedStatement stmt
                                                                                    = con.prepareStatement(q);
                                                                            stmt.setInt(1, start);
                                                                            stmt.setInt(2, recordCount);
                                                                            ResultSet rs
                                                                                    = stmt.executeQuery();
                                                                            while (rs.next()) {%>
                                                                    <tr>
                                                                        <td class="cus_id"><%= rs.getString("uid")%></td>
                                                                        <td><%= rs.getString("created_at")%></td>
                                                                        <td><%= rs.getString("full_name")%></td>
                                                                        <td>
                                                                            <img src="User_img/<%= rs.getString("image")%>"
                                                                                 style="width:60px; height: 40px;">
                                                                        </td>
                                                                        <td><%= rs.getString("phone")%></td>
                                                                        <td><%= rs.getString("email")%></td>
                                                                        <td><%= rs.getString("gender")%></td>
                                                                        <td><%= rs.getString("address")%></td>

                                                                        <td>
                                                                            <button type="button" class="btn btn-danger btn-sm del_cus" data-bs-toggle="modal" data-bs-target="#cusdelet">
                                                            Delete </button>
                                                                        </td>
                                                                    </tr>

                                                                    <% }
                                                                            String sql = "select count(*) from user";
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
                                                                                            href="admin_dashboard.jsp?pgno=<%= i%>"
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
<!--                                            customer delete start -->
                                                  <div class="modal fade" id="cusdelet" tabindex="-1" aria-labelledby="cusdelet" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="DeleteCustomer" method="Get">
                                            
                                            
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="admdelet">Do you want to Delete?</h5>
                                            <input type="hidden" name="uid" id="pass_cus_id">
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                             <button type="submit" class="btn btn-danger" >Delete</button>
                                        </div>
                                            </form>
                                    </div>
                                </div>
                            </div>
<!--                                             customer delete END -->
                                            
                                                <!--Online Booking started-->
                                                <div
                                                    class="tab-pane fade"
                                                    id="v-pills-online-booking"
                                                    role="tabpanel"
                                                    aria-labelledby="v-pills-online-booking-tab"
                                                    >
                                                    <div class="row mb-3">
                                                        <h1>Online Booking</h1>
                                                    </div>
                                           <div class=" my-3 d-flex w-75 h-75 justify-content-start">
                                                            <div>
                                                               <input
                                                                    type="text"
                                                                    placeholder="Search Here"
                                                                    class="form-control table-responsive"
                                                                     id="obSerInp"
                                                                    />
                                                                
                                                            </div>
                                                        
                                                                </div>
                                                 
                                                    <div class="row">
                                                        <table
                                                            class="table bg-white rounded shadow-sm table-hover table-responsive"
                                                            >
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">ID</th>
                                                                    <th scope="col">Date</th>
                                                                    <th scope="col">Name</th>
                                                                    <th scope="col">Bike Num</th>
                                                                    <th scope="col">Booking Date</th>
                                                                    <th scope="col">Email</th>
                                                                    <th scope="col">Problem</th>
                                                                    <th scope="col">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="obSertbl">
                                                                <%
                                                                    int obtotal = 0;
                                                                    int obstart = 0, obrecordCount = 4;
                                                                    
                                                                    try {
                                                                         int obpgno = request.getParameter("obpgno") == null ? 0 : Integer.parseInt(request.getParameter("obpgno"));
                                                                            obstart = obpgno * obrecordCount;
                                                                        Connection con = ConnectionProvider.getCon();
                                                                        Statement statement = con.createStatement();
                                                                        
                                                                        String q = "SELECT * from onlinebooking where booking_status IS NULL ORDER BY obid DESC limit ?,?";
                                                                         PreparedStatement stmt = con.prepareStatement(q);
                                                                            stmt.setInt(1, obstart);
                                                                            stmt.setInt(2, obrecordCount);
                                                                        ResultSet resultSet = stmt.executeQuery();
                                                                        while (resultSet.next()) {%>
                                                                <tr>
                                                                    <td><%= resultSet.getString("obid")%></td>
                                                                    <td><%= resultSet.getString("created_at")%></td>
                                                                    <td><%= resultSet.getString("c_name")%></td>
                                                                    <td><%= resultSet.getString("bike_num")%></td>
                                                                    <td>
                                                                        <%= resultSet.getString("booking_date")%> <br />
                                                                        <%= resultSet.getString("booking_time")%>
                                                                    </td>
                                                                    <td><%= resultSet.getString("c_email")%></td>
                                                                    <td><%= resultSet.getString("problems")%></td>

                                                                    <td>
                                                                                                                                           <% OnlinebookingDao onlineBookingDao = new OnlinebookingDao(ConnectionProvider.getCon());
                                                                                                                                               if (onlineBookingDao.isAccepted(Integer.parseInt(resultSet.getString("obid")))
                                                                                                                                                       == null) {%>
                                                                                                                                           <a                                                                     href="BookingProcessServlet?uid=<%=resultSet.getString("obid"
                                                                                                                                           )%>&booking_status=1"
                                                                                                                                           type="button"
                                                                                                                                           class="btn btn-success btn-sm"
                                                                                                                                           >Accept</a
                                                                        >
                                                                        <a
                                                                            href="BookingProcessServlet?uid=<%=resultSet.getString("obid"
                                                                            )%>&booking_status=0"
                                                                            type="button"
                                                                            class="btn btn-danger btn-sm"
                                                                            >Deny</a
                                                                        >
                                                                        <%} else if (onlineBookingDao.isAccepted(Integer.parseInt(resultSet.getString("obid"))).equals("1")) {%>
                                                                        <a
                                                                            href="#"
                                                                            type="button"
                                                                            disabled
                                                                            class="btn btn-success btn-sm"
                                                                            >Accepted</a
                                                                        >
                                                                        <% } else {%>
                                                                        <a
                                                                            href="#"
                                                                            type="button"
                                                                            disabled
                                                                            class="btn btn-danger btn-sm"
                                                                            >Rejected</a
                                                                        >
                                                                        <%}%>
                                                                    </td>
                                                                </tr>
                                                                <% }
                                                                String sql = "select count(*) from onlinebooking where booking_status IS NULL";
                                                                            PreparedStatement stmt1 = con.prepareStatement(sql);
                                                                            ResultSet onlinebook = stmt1.executeQuery();
                                                                            if (onlinebook.next()) {
                                                                                obtotal = onlinebook.getInt(1);
                                                                            }
                                                                    } catch (Exception e) {
                                                                        e.printStackTrace();
                                                                    } %>
                                                                    <tr>
                                                                        <th colspan="9">
                                                                            <table>
                                                                                <tr>
                                                                                    <% for (int i = 0; i <= obtotal / obrecordCount; i++) {%>
                                                                                    <td>
                                                                                        <a
                                                                                            href="admin_dashboard.jsp?obpgno=<%= i%>"
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

                                                <!--Bike Details started-->
                                                <div
                                                    class="tab-pane fade"
                                                    id="v-pills-bikes"
                                                    role="tabpanel"
                                                    aria-labelledby="v-pills-bikes-tab"
                                                    >
                                                    <div class="row">
                                                        <h3 class="mb-3">Bike Details</h3>
                                                        <div class=" d-flex w-75 h-75 justify-content-start">
                                                            <!-- add update delete start -->
                                                           
<!--                                                            
                                                            <!-- Add Mechanic Button trigger modal  start-->

                                                            <div
                                                                class="modal fade"
                                                                id="addBike"
                                                                tabindex="-1"
                                                                aria-labelledby="addBikeLabel"
                                                                aria-hidden="true"
                                                                >
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body">
                                                                            <!-- form start -->
                                                                            <div class="card">
                                                                                <div
                                                                                    class="card-header bg-success text-white text-center"
                                                                                    >
                                                                                    <h5 class="d-flex justify-content-center">
                                                                                        Add New Bike
                                                                                    </h5>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                   <form onsubmit="return BikeFormValid()" action="AddBikeadmin" method="POST" enctype="multipart/form-data">

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
                                                                                <input type="text" class="form-control" placeholder="Red"  maxlength="7" name="color" required>
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
                                                                                <input type="text" class="form-control" placeholder="BA 34 PA 359" name="bike_number" id="bikeNum"  maxlength="18" required>
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
                                                                         <div class="row">
                                                                            <div class="col">
                                                                                <label  class="form-label">Customer ID</label>
                                                                             
                                                                            </div>
                                                                            <div class="col">
                                                                                
                                                                                <input type="number" class="form-control"  name="bcid" onKeyPress="if (this.value.length == 4) return false;" required>
                                                                            </div>
                                                                        </div>
                                                                        <br>

                                                                        <div class="d-flex ">         
                                                                            <button type="submit" class="btn btn-danger me-5" name="submit">Submit</button>
                                                                        </div>

                                                                    </form>
                                                                                </div>
                                                                            </div>

                                                                            <!-- add  form end -->
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button
                                                                                type="button"
                                                                                class="btn btn-secondary"
                                                                                data-bs-dismiss="modal"
                                                                                >
                                                                                Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Add Mechanic Button trigger modal  end-->
                                                            <!-- Update Mechanic Button trigger modal  start-->
                                                            <div
                                                                class="modal fade"
                                                                id="updateBike"
                                                                tabindex="-1"
                                                                aria-labelledby="updateBikeLabel"
                                                                aria-hidden="true"
                                                                >
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body">
                                                                            <!-- form start -->
                                                                          

                                                                            <!-- updating form end -->
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button
                                                                                type="button"
                                                                                class="btn btn-secondary"
                                                                                data-bs-dismiss="modal"
                                                                                >
                                                                                Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- delete Mechanic button Trigger model end -->
                                                            <!-- Delete Button trigger start -->
                                                            <div
                                                                class="modal fade"
                                                                id="deleteBike"
                                                                tabindex="-1"
                                                                aria-labelledby="deleteBikeLabel"
                                                                aria-hidden="true"
                                                                >
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body">
                                                                            <div class="card">
                                                                                <div
                                                                                    class="card-header bg-danger text-white text-center"
                                                                                    >
                                                                                    <h5 class="d-flex justify-content-center">
                                                                                        Enter Bike Number to Delete
                                                                                    </h5>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                    <form action="login" method="POST">
                                                                                        <div class="mb-3">
                                                                                            <label
                                                                                                for="exampleInputEmail1"
                                                                                                class="form-label"
                                                                                                ><i class="fa fa-motorcycle"></i> Bike
                                                                                                Number</label
                                                                                            >
                                                                                            <input
                                                                                                type="text"
                                                                                                class="form-control"
                                                                                                id="exampleInputEmail1"
                                                                                                aria-describedby="emailHelp"
                                                                                                required
                                                                                                />
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <button
                                                                                                type="submit"
                                                                                                class="btn btn-danger me-5"
                                                                                                >
                                                                                                Delete
                                                                                            </button>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button
                                                                                type="button"
                                                                                class="btn btn-secondary"
                                                                                data-bs-dismiss="modal"
                                                                                >
                                                                                Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- delete trigger button end -->
                                                            <!-- // add update delete end -->
                                                            <div>
                                                                 <button
                                                                type="button"
                                                                class="btn btn-success me-2"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#addBike"
                                                                >
                                                                Add New Bike
                                                            </button>
                                                            </div>
                                                            <div>
                                                              <input
                                                                    type="text"
                                                                    placeholder="Search Here"
                                                                    class="form-control"
                                                                    id="bikeSerInput"
                                                                    />
                                                             </div>
                                                        </div>
                                      
                                                        <div class="col">
                                                             <br> 
                                                            <table class="table bg-white rounded shadow-sm table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">ID</th>
<!--                                                                        <th scope="col">Date</th>-->
                                                                        <th scope="col">Company</th>
                                                                        <th scope="col">Model</th>
                                                                        <th scope="col">Bike Num</th>
                                                                        <th scope="col">Color</th>
                                                                        <th scope="col">Picture</th>
                                                                        <th scope="col">Name</th>
                                                                        <th scope="col">Email</th>
                                                                        <th scope="col">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="bikeSertbl">
                                                                    <% try {
                                                                            Connection con = ConnectionProvider.getCon();
                                                                            Statement statement = con.createStatement();
                                                                            String q
                                                                                    = "select * from bike ORDER BY bid DESC ";
                                                                            ResultSet resultSet
                                                                                    = statement.executeQuery(q);
                                                                            while (resultSet.next()) {%>

                                                                    <tr>
                                                                        <td class="bike_id"><%= resultSet.getString("bid")%></td>
<!--                                                                        <td><%= resultSet.getString("created_at")%></td>-->
                                                                        <td ><%= resultSet.getString("company")%></td>
                                                                        <td><%= resultSet.getString("model")%></td>
                                                                        <td><%= resultSet.getString("bike_num")%></td>
                                                                        <td><%= resultSet.getString("color")%></td>
                                                                        <td>
                                                                            <img
                                                                                src="Bike_img/<%=resultSet.getString("bike_img")%>"
                                                                                style="width:40px; height: 20px;">
                                                                        </td>
                                                                        <td><%= resultSet.getString("cname")%></td>
                                                                        <td><%= resultSet.getString("cemail")%></td>
                                                                         <td class="d-flex align-self-stretch">
                                                                            <a
                                                                                href="updatebike.jsp?uid=<%= resultSet.getString("uid") %>"
                                                                                target="_self"
                                                                                type="button"
                                                                                class="btn btn-warning mx-3 btn-sm text-decoration-none"
                                                                                >Update
                                                                            </a>                                                                        
                                                      <button type="button" class="btn btn-danger btn-sm del_bike " data-bs-toggle="modal" data-bs-target="#bikedelete"> Delete </button>
                                                                             
                                                                        </td>
                                                                    </tr>
                                                                    <% }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        } %>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                    
                                                  <!--delete bike start--> 
                                                  <div class="modal fade" id="bikedelete" tabindex="-1" aria-labelledby="lbikedelete" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="DeleteBikeAdmServ" method="Get"> 
										
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="bikedelete">Do you want to Delete?</h5>
                                            <input type="hidden" name="bid" id="pass_bike_id">
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                             <button type="submit" class="btn btn-danger" >Delete</button>
                                        </div>
                                            </form>
                                    </div>
                                </div>
                            </div>
                                                  
                                                  <!--delete bike end--> 
                                                  
                                                                
                                                                
                                                                
                                                <!-- Servicing History started  -->
                                                <div
                                                    class="tab-pane fade"
                                                    id="v-pills-servicing-history"
                                                    role="tabpanel"
                                                    aria-labelledby="v-pills-servicing-history-tab"
                                                    >
                                                    <div class="row">
                                                        <h3 class="mb-3">Servicing History</h3>
                                                        <div class="mb-3 d-flex w-75 h-75 justify-content-start">
                                                           

                                                            <!-- Add servicing Button trigger modal  start-->

                                                            <div
                                                                class="modal fade"
                                                                id="addServicing"
                                                                tabindex="-1"
                                                                aria-labelledby="addServicingLabel"
                                                                aria-hidden="true"
                                                                >
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body">
                                                                            <!-- form start -->
                                                                            <div class="card">
                                                                                <div
                                                                                    class="card-header bg-success text-white text-center"
                                                                                    >
                                                                                    <h5 class="d-flex justify-content-center">
                                                                                        Add Servicing Details
                                                                                    </h5>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                    <!--?####FORM-->
                                                                                    <form action="AddServicingHistory" method="POST">
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <label class="form-label"
                                                                                                       >Bike Number*</label
                                                                                                >
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    
                                                                                                    name="bikeNum" maxlength="20"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <label class="form-label">Amount*</label>
                                                                                                <input
                                                                                                    type="number"
                                                                                                    class="form-control"
                                                                                                    
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
                                                                                                    maxlength="50"
                                                                                                    ></textarea>
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
                                                                            </div>

                                                                            <!-- add  form end -->
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button
                                                                                type="button"
                                                                                class="btn btn-secondary"
                                                                                data-bs-dismiss="modal"
                                                                                >
                                                                                Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Add servicing history Button trigger modal  end-->
                                                            <!-- Update servicing history Button trigger modal  start-->
                                                            <div
                                                                class="modal fade"
                                                                id="updateServicing"
                                                                tabindex="-1"
                                                                aria-labelledby="updateServicingLabel"
                                                                aria-hidden="true"
                                                                >
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body">
                                                                            <!-- form start -->
                                                                            <div class="card">
                                                                                <div
                                                                                    class="card-header bg-success text-white text-center"
                                                                                    >
                                                                                    <h5 class="d-flex justify-content-center">
                                                                                        Update Servicing Details
                                                                                    </h5>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                    <!--?####FORM-->
                                                                                    <form action="Register" method="POST">
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <label class="form-label"
                                                                                                       >Customer Name*</label
                                                                                                >
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    placeholder="Full Name"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <label class="form-label">Email*</label>
                                                                                                <input
                                                                                                    type="email"
                                                                                                    class="form-control"
                                                                                                    placeholder="Email"
                                                                                                    name="email"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <label class="form-label"
                                                                                                       >Bike Number*</label
                                                                                                >
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    placeholder="BA 99 PA 578"
                                                                                                    name="bikeNum"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <label class="form-label">Amount*</label>
                                                                                                <input
                                                                                                    type="number"
                                                                                                    class="form-control"
                                                                                                    placeholder="Rs 200"
                                                                                                    name="amount"
                                                                                                    required
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
                                                                                                    placeholder="1500"
                                                                                                    name="Km"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <label class="form-label"
                                                                                                       >Customer ID*</label
                                                                                                >
                                                                                                <input
                                                                                                    type="number"
                                                                                                    class="form-control"
                                                                                                    placeholder="1"
                                                                                                    name="uid"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                        </div>

                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <label class="form-label"> Bike ID*</label>
                                                                                                <input
                                                                                                    type="number"
                                                                                                    class="form-control"
                                                                                                    placeholder="1"
                                                                                                    name="Km"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <label class="form-label"
                                                                                                       >Parts Changed</label
                                                                                                >
                                                                                                <textarea
                                                                                                    class="form-control"
                                                                                                    placeholder="Parts change"
                                                                                                    name="partsChange"
                                                                                                    rows="4"
                                                                                                    cols="25"
                                                                                                    required
                                                                                                    >
                                                                                                </textarea>
                                                                                            </div>
                                                                                        </div>
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
                                                                            </div>
                                                                            <!-- updating form end -->
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button
                                                                                type="button"
                                                                                class="btn btn-secondary"
                                                                                data-bs-dismiss="modal"
                                                                                >
                                                                                Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- update servicing history button Trigger model end -->
                                                            <!-- Delete servicing history trigger start -->
                                                            <div
                                                                class="modal fade"
                                                                id="deleteServicing"
                                                                tabindex="-1"
                                                                aria-labelledby="deleteServicingLabel"
                                                                aria-hidden="true"
                                                                >
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body">
                                                                            <div class="card">
                                                                                <div
                                                                                    class="card-header bg-danger text-white text-center"
                                                                                    >
                                                                                    <h5 class="d-flex justify-content-center">
                                                                                        Enter Servicing ID to Delete
                                                                                    </h5>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                    <form action="login" method="POST">
                                                                                        <div class="mb-3">
                                                                                            <label class="form-label"
                                                                                                   ><i class="fa fa-cogs"></i> Servicing
                                                                                                Id</label
                                                                                            >
                                                                                            <input
                                                                                                type="number"
                                                                                                class="form-control"
                                                                                                required
                                                                                                />
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <button
                                                                                                type="submit"
                                                                                                class="btn btn-danger me-5"
                                                                                                >
                                                                                                Delete
                                                                                            </button>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button
                                                                                type="button"
                                                                                class="btn btn-secondary"
                                                                                data-bs-dismiss="modal"
                                                                                >
                                                                                Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- delete servicing history trigger button end -->
                                                            <!-- // add update delete end -->
                                                            
                                                            <div>
                                                                <button
                                                                type="button"
                                                                class="btn btn-success me-2"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#addServicing"
                                                                >
                                                                Add Servicing
                                                            </button>
                                                            </div>
                                                             <div >
                                                         <input
                                                                    type="text"
                                                                    placeholder="Search Here"
                                                                    class="form-control"
                                                                    id="servcSerInp"
                                                                    />
                                                                
                                                                </div>
                                                        </div>
                                                       
                                                        
                                                        <div class="row">
                                                            <table class="table bg-white table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">ID</th>
                                                                        <th scope="col">Date</th>
                                                                        <th scope="col">Name</th>
                                                                        <th scope="col">Email</th>
                                                                        <th scope="col">Bike No</th>
                                                                        <th scope="col">Amount</th>
                                                                        <th scope="col">KM</th>
                                                                        <th scope="col">Next KM</th>
                                                                        <th scope="col">Next Date</th>
                                                                        <th scope="col">Parts Changed</th>
                                                                        <th scope="col">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="servcSertbl">
                                                                    <% try {
                                                                            Connection con = ConnectionProvider.getCon();
                                                                            String q2 = "select * from servicing_history ORDER BY sid DESC; ";
                                                                            PreparedStatement pstmt  = con.prepareStatement(q2);
                                                                            ResultSet rs = pstmt.executeQuery();
                                                                            while (rs.next()) {%>

                                                                    <tr>
                                                                        <th class="ser_id"><%= rs.getString("sid")%></th>
                                                                        <td><%= rs.getString("servicing_at")%></td>
                                                                        <td><%= rs.getString("scname")%></td>
                                                                        <td><%= rs.getString("scemail")%></td>
                                                                        <td><%= rs.getString("bike_num")%></td>
                                                                        <td><%= rs.getString("amount")%></td>
                                                                        <td><%= rs.getString("km")%></td>
                                                                        <td><%= rs.getString("next_km")%></td>
                                                                        <td><%= rs.getString("next_servicing")%></td>
                                                                        <td><%= rs.getString("parts_changed")%></td>
                                                                        <!--   <td class="d-flex">-->
                                                                       <td class="d-flex align-self-stretch">
                                                                            <a
                                                                                href="updateServicing.jsp?sid=<%= rs.getString("sid") %>"
                                                                                target="_self"
                                                                                type="button"
                                                                                class="btn btn-warning mx-3 btn-sm text-decoration-none"
                                                                                >Update
                                                                            </a>                                                                        
                                                      <button type="button" class="btn btn-danger btn-sm del_ser " data-bs-toggle="modal" data-bs-target="#serdelete"> Delete </button>
                                                                             
                                                                        </td>
                                                                    </tr>
                                                                    <% }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        } %>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                                
                            <!--delete servicing history start-->
                            <div class="modal fade" id="serdelete" tabindex="-1" aria-labelledby="lserdelete" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="DeleteServicingHservelt" method="Get"> 
										
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="serdelete">Do you want to Delete?</h5>
                                            <input type="hidden" name="sid" id="pass_ser_id">
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                             <button type="submit" class="btn btn-danger" >Delete</button>
                                        </div>
                                            </form>
                                    </div>
                                </div>
                            </div>
                             <!--delete servicing history end-->
                                                                

                                                <!--Feedback started-->
                                                <div
                                                    class="tab-pane fade"
                                                    id="v-pills-feedback"
                                                    role="tabpanel"
                                                    aria-labelledby="v-pills-feedback-tab"
                                                    >
                                                    <div class="row">
                                                        <h3 class="">User Feedback</h3>
                                                        <div class=" my-3 d-flex w-75 h-75 justify-content-start">
                                                            <div>
                                                                <input
                                                                    type="text"
                                                                    placeholder="Search Here "
                                                                    class="form-control"
                                                                    id="feedbSerInp"
                                                                    />
                                                                
                                                            </div>
                                                        
                                                                </div>
                                                        <div class="mb-3">
                                                            <div class="row">
                                                                <table class="table bg-white rounded shadow-sm table-hover">
                                                                    <thead>
                                                                        <tr>
                                                                            <th scope="col" width="5">ID</th>
                                                                            <th scope="col">Date</th>
                                                                            <th scope="col">User ID</th>
                                                                            <th scope="col">Name</th>
                                                                            <th scope="col">Email</th>
                                                                            <th scope="col">Message</th>
                                                                            <th scope="col">Action</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody id="feedbSertbl">
                                                                        <% 
                                                                            int fTotal = 0;
                                                                        int fstart = 0, frecordCount = 6;
                                                                            try {
                                                                                int fpgno = request.getParameter("fpgno") == null? 0 : Integer.parseInt(request.getParameter("fpgno"));
                                                                            start = fpgno * recordCount;
                                                                                Connection con = ConnectionProvider.getCon();
                                                                                Statement statement = con.createStatement();
                                                                                String q = "SELECT * from userfeedback ORDER BY ufid DESC limit ?,?";
                                                                                PreparedStatement stmt = con.prepareStatement(q);
                                                                            stmt.setInt(1, fstart);
                                                                            stmt.setInt(2, frecordCount);
                                                                                ResultSet resultSet   = stmt.executeQuery();
                                                                                while (resultSet.next()) {%>
                                                                        <tr>
                                                                            <th><%= resultSet.getString("ufid")%></th>
                                                                            <td><%= resultSet.getString("created_at")%></td>
                                                                            <td><%= resultSet.getString("uid")%></td>
                                                                            <td><%= resultSet.getString("u_name")%></td>
                                                                            <td><%= resultSet.getString("u_email")%></td>
                                                                            <td><%= resultSet.getString("Message")%></td>
                                                                            <td class="d-flex">
                                                                                <a
                                                                                    href="#"
                                                                                    type="button"
                                                                                    class="btn btn-danger btn-sm"
                                                                                    >Reply</a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <% }
                                                                             String sql = "select count(*) from userfeedback";
                                                                            PreparedStatement stmt1 = con.prepareStatement(sql);
                                                                            ResultSet ursf = stmt1.executeQuery();
                                                                            if (ursf.next()) {
                                                                                fTotal = ursf.getInt(1);
                                                                            }
                                                                            } catch (Exception e) {
                                                                                e.printStackTrace();
                                                                            } %>
                                                                            <tr>
                                                                        <th colspan="9">
                                                                            <table>
                                                                                <tr>
                                                                                    <% for (int i = 0; i <= fTotal / frecordCount; i++) {%>
                                                                                    <td>
                                                                                        <a
                                                                                            href="admin_dashboard.jsp?fpgno=<%= i%>"
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
                                                </div>

                                                <!--Mechanics started-->
                                                <div
                                                    class="tab-pane fade"
                                                    id="v-pills-mechanics"
                                                    role="tabpanel"
                                                    aria-labelledby="v-pills-mechanics-tab"
                                                    >
                                                    <div class="row">
                                                        <h3 class="mb-1">Mechanics Details</h3>
                                                        <div class="my-2">
                                                            <!-- // add update delete start -->
                                                           

                                                            <!-- Add Mechanic Button trigger modal  start-->

                                                            <div
                                                                class="modal fade"
                                                                id="addMechanic"
                                                                tabindex="-1"
                                                                aria-labelledby="addMechanic"
                                                                aria-hidden="true"
                                                                >
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body">
                                                                            <!-- form start -->
                                                                            <div class="card">
                                                                                <div
                                                                                    class="card-header bg-success text-white text-center"
                                                                                    >
                                                                                    <h4 class="d-flex justify-content-center">
                                                                                        Add Mechanic
                                                                                    </h4>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                    <!--?####FORM-->
                                                                                    <form
                                                                                        action="AddMechanic"
                                                                                        method="POST"
                                                                                        enctype="multipart/form-data"
                                                                                        >
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    placeholder="Full Name"
                                                                                                    name="full_name"
                                                                                                    required
                                                                                                    maxlength="20" />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="email"
                                                                                                    class="form-control"
                                                                                                    placeholder="Email"
                                                                                                    name="email"
                                                                                                    required maxlength="20"
                                                                                                    />
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="number"
                                                                                                    class="form-control"
                                                                                                    placeholder="Phone"
                                                                                                    name="phone"
                                                                                                    required  onKeyPress="if (this.value.length == 10) return false;"
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <div class="form-check form-check-inline">
                                                                                                    <input
                                                                                                        class="form-check-input"
                                                                                                        type="radio"
                                                                                                        name="gender"
                                                                                                        value="Male"
                                                                                                        />
                                                                                                    <label class="form-check-label"
                                                                                                           >Male</label
                                                                                                    >
                                                                                                </div>
                                                                                                <div class="form-check form-check-inline">
                                                                                                    <input
                                                                                                        class="form-check-input"
                                                                                                        type="radio"
                                                                                                        name="gender"
                                                                                                        value="Female"
                                                                                                        />
                                                                                                    <label class="form-check-label"
                                                                                                           >Female</label
                                                                                                    >
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="file"
                                                                                                    class="form-control"
                                                                                                    name="photo"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="number"
                                                                                                    class="form-control"
                                                                                                    placeholder="Salary"
                                                                                                    name="salary"
                                                                                                    required  onKeyPress="if (this.value.length == 6) return false;"
                                                                                                    />
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    placeholder="Address"
                                                                                                    name="address"
                                                                                                    required maxlength="15"
                                                                                                    />
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
                                                                            </div>
                                                                            <!-- add  form end -->
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button
                                                                                type="button"
                                                                                class="btn btn-secondary"
                                                                                data-bs-dismiss="modal"
                                                                                >
                                                                                Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="d-flex w-75 h-75 justify-content-start">
                                                        <div>
                                                             <button
                                                                type="button"
                                                                class="btn btn-success me-2"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#addMechanic"
                                                                >
                                                                Add New
                                                            </button>
                                                        </div>
                                                        <div>
                                                        <input
                                                                    type="text"
                                                                    placeholder="Search Here"
                                                                    class="form-control"
                                                                    id="mecSerInp"
                                                                    />
                                                           </div>
                                                               <br />   <br />
                                                            </div>
                                                        
                                                        <div class="row">
                                                           
                                                            <table class="table bg-white rounded shadow-sm table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col" width="5">ID</th>
                                                                        <th scope="col">Date</th>
                                                                        <th scope="col">Name</th>
                                                                        <th scope="col">Picture</th>
                                                                        <th scope="col">Phone</th>
                                                                        <th scope="col">Email</th>
                                                                        <th scope="col">Gender</th>
                                                                        <th scope="col">Address</th>
                                                                        <th scope="col">Salary</th>
                                                                        <th scope="col">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="mecSertbl" >
                                                                    <% 
                                                                         int mTotal = 0;
                                                                        int mstart = 0, mrecordCount = 6;
                                                                        try {
                                                                            int mpgno = request.getParameter("mpgno") == null ? 0 : Integer.parseInt(request.getParameter("mpgno"));
                                                                            mstart = mpgno * mrecordCount;
                                                                            Connection con = ConnectionProvider.getCon();
                                                                            Statement statement = con.createStatement();
                                                                            String q = "SELECT * from Mechanic ORDER BY mid DESC limit ?,?";
                                                                             PreparedStatement stmt = con.prepareStatement(q);
                                                                            stmt.setInt(1, mstart);
                                                                            stmt.setInt(2, mrecordCount);
                                                                            ResultSet resultSet = stmt.executeQuery();
                                                                            while (resultSet.next()) {%>
                                                                    <tr>
                                                                        <th class="mec_id"><%= resultSet.getString("mid")%></th>
                                                                        <td><%= resultSet.getString("created_at")%></td>
                                                                        <td><%= resultSet.getString("full_name")%></td>
                                                                        <td>
                                                                            <img
                                                                                src="Mechanic_img/<%=resultSet.getString("photo")%>"
                                                                                style="width:40px; height: 40px;">
                                                                        </td>
                                                                        <td><%= resultSet.getString("phone")%></td>
                                                                        <td><%= resultSet.getString("email")%></td>
                                                                        <td><%= resultSet.getString("gender")%></td>
                                                                        <td><%= resultSet.getString("address")%></td>
                                                                        <td><%= resultSet.getString("salary")%></td>
                                                                        <td class="d-flex">
                                                                            <a
                                                                                href="updateMechanic.jsp?mid=<%= resultSet.getString("mid"
                                                                                )%>"
                                                                                target="_self"
                                                                                type="button"
                                                                                class="btn btn-warning mx-3 btn-sm"
                                                                                >Update
                                                                            </a>
                                                                             <button type="button" class="btn btn-danger btn-sm del_mec" data-bs-toggle="modal" data-bs-target="#mecdelet">
                                                            Delete </button>
                                                                        </td>
                                                                    </tr>
                                                                     <% }
                                                                            String sql = "select count(*) from Mechanic";
                                                                            PreparedStatement stmt1 = con.prepareStatement(sql);
                                                                            ResultSet mec = stmt1.executeQuery();
                                                                            if (mec.next()) {
                                                                                mTotal = mec.getInt(1);
                                                                            }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        } %>
                                                                    <tr>
                                                                        <th colspan="9">
                                                                            <table>
                                                                                <tr>
                                                                                    <% for (int i = 0; i <= mTotal / mrecordCount; i++) {%>
                                                                                    <td>
                                                                                        <a
                                                                                            href="admin_dashboard.jsp?mpgno=<%= i%>"
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
                 <!--delete mechnic starr-->
                   <div class="modal fade" id="mecdelet" tabindex="-1" aria-labelledby="mecdelet" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="DeleteMechanic" method="Get"> 
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="mecdelet">Do you want to Delete?</h5>
                                            <input type="hidden" name="mid" id="pass_mec_id">
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                             <button type="submit" class="btn btn-danger" >Delete</button>
                                        </div>
                                            </form>
                                    </div>
                                </div>
                            </div>
							
                                                     <!--delete mechnic end-->

                                                <!-- Admin Details started  -->
                                                <div
                                                    class="tab-pane fade"
                                                    id="v-pills-admin"
                                                    role="tabpanel"
                                                    aria-labelledby="v-pills-admin-tab"
                                                    >
                                                    <div class="row">
                                                        <h3 class="mb-3">Admin Details</h3>
                                                        <div class="mb-3">
                                                            <!-- // add admin start -->
                                                            <div class="d-flex w-75 h-75 justify-content-start">
                                                                <div>
                                                                    <button
                                                                type="button"
                                                                class="btn btn-success me-2"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#addAdmin"
                                                                >Add New</button>
                                                                </div> 
                                                            
                                                                <div>
                                                                  <input
                                                                    type="text"
                                                                    placeholder="Search Here"
                                                                    class="form-control"
                                                                    id="admSerInp"
                                                                    />  
                                                                </div>
                                                                
                                                            </div>
                                                            	

                                                            <div
                                                                class="modal fade"
                                                                id="addAdmin"
                                                                tabindex="-1"
                                                                aria-labelledby="addAdmin"
                                                                aria-hidden="true"
                                                                >
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body">
                                                                            <!-- form start -->
                                                                            <div class="card">
                                                                                <div
                                                                                    class="card-header bg-success text-white text-center"
                                                                                    >
                                                                                    <h4 class="d-flex justify-content-center">
                                                                                        Add Admin
                                                                                    </h4>
                                                                                    
                                                                                </div>
                                                                                <div class="card-body">
                                                                                    <!--?####FORM-->
                                                                                    <form
                                                                                        action="AddAdminServlet"
                                                                                        method="POST"
                                                                                        enctype="multipart/form-data"
                                                                                        >
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    placeholder="Full Name"
                                                                                                    name="full_name"
                                                                                                    required  maxlength="20"
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="email"
                                                                                                    class="form-control"
                                                                                                    placeholder="Email"
                                                                                                    name="email"  maxlength="20"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="number"
                                                                                                    class="form-control"
                                                                                                    placeholder="Phone"
                                                                                                    name="phone" onKeyPress="if (this.value.length == 10) return false;"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <div class="form-check form-check-inline">
                                                                                                    <input
                                                                                                        class="form-check-input"
                                                                                                        type="radio"
                                                                                                        name="gender"
                                                                                                        value="Male"
                                                                                                        />
                                                                                                    <label class="form-check-label"
                                                                                                           >Male</label
                                                                                                    >
                                                                                                </div>
                                                                                                <div class="form-check form-check-inline">
                                                                                                    <input
                                                                                                        class="form-check-input"
                                                                                                        type="radio"
                                                                                                        name="gender"
                                                                                                        value="Female"
                                                                                                        />
                                                                                                    <label class="form-check-label"
                                                                                                           >Female</label
                                                                                                    >
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="file"
                                                                                                    class="form-control"
                                                                                                    name="photo"
                                                                                                    required
                                                                                                    />
                                                                                            </div>
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="password"
                                                                                                    class="form-control"
                                                                                                    name="password"
                                                                                                    required  maxlength="10"
                                                                                                    />
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col">
                                                                                                <input
                                                                                                    type="text"
                                                                                                    class="form-control"
                                                                                                    placeholder="Address"
                                                                                                    name="address"  maxlength="15"
                                                                                                    required
                                                                                                    />
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
                                                                            </div>
                                                                            <!-- add  form end -->
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button
                                                                                type="button"
                                                                                class="btn btn-secondary"
                                                                                data-bs-dismiss="modal"
                                                                                >
                                                                                Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />
                                                        <div class="row">
                                                            <table class="table bg-white rounded shadow-sm table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col" width="5">ID</th>
                                                                        <th scope="col">Date</th>
                                                                        <th scope="col">Name</th>
                                                                        <th scope="col">Picture</th>
                                                                        <th scope="col">Phone</th>
                                                                        <th scope="col">Email</th>
                                                                        <th scope="col">Gender</th>
                                                                        <th scope="col">Address</th>
                                                                        <th scope="col">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="admSertbl" >
                                                                    <% 
                                                                        int adTotal = 0;
                                                                        int adstart = 0, adrecordCount = 6;
                                                                        try {
                                                                             int adpgno = request.getParameter("adpgno") == null ? 0 : Integer.parseInt(request.getParameter("adpgno"));
                                                                            adstart = adpgno * adrecordCount;
                                                                            Connection con = ConnectionProvider.getCon();
                                                                            Statement statement = con.createStatement();
                                                                            String q = "SELECT * from admin ORDER BY aid DESC  limit ?,?";
                                                                            PreparedStatement stmt = con.prepareStatement(q);
                                                                            stmt.setInt(1, adstart);
                                                                            stmt.setInt(2, adrecordCount);
                                                                            ResultSet rs = stmt.executeQuery();
                                                                            while (rs.next()) {%>
                                                                    <tr>
                                                                        <td class =" adm_id" ><%= rs.getString("aid")%></td>
                                                                        <td><%= rs.getString("created_at")%></td>
                                                                        <td><%= rs.getString("full_name")%></td>
                                                                        <td>
                                                                            <img
                                                                                src="Admin_img/<%= rs.getString("photo"
                                                                                )%>"
                                                                                style="width: 40px; height: 40px"
                                                                                />
                                                                        </td>
                                                                        <td><%= rs.getString("phone")%></td>
                                                                        <td><%= rs.getString("email")%></td>
                                                                        <td><%= rs.getString("gender")%></td>
                                                                        <td><%= rs.getString("address")%></td>
                                                                        <td class="d-flex align-self-stretch">
                                                                            <a
                                                                                href="updateAdmin.jsp?aid=<%= rs.getString("aid")%>"
                                                                                target="_self"
                                                                                type="button"
                                                                                class="btn btn-warning mx-3 btn-sm text-decoration-none"
                                                                                >Update
                                                                            </a>                                                                        
                                                      <button type="button" class="btn btn-danger btn-sm del_adm " data-bs-toggle="modal" data-bs-target="#admdelet"> Delete </button>
                                                                             
                                                                        </td>
                                                                    </tr>
                                                                    <% }
                                                                    String sql = "select count(*) from admin";
                                                                            PreparedStatement stmt1 = con.prepareStatement(sql);
                                                                            ResultSet adm = stmt1.executeQuery();
                                                                            if (adm.next()) {
                                                                                Total = adm.getInt(1);
                                                                            }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        }%>
                                                                        <tr>
                                                                        <th colspan="9">
                                                                            <table>
                                                                                <tr>
                                                                                    <% for (int i = 0; i <= adTotal / adrecordCount; i++) {%>
                                                                                    <td>
                                                                                        <a
                                                                                            href="admin_dashboard.jsp?adpgno=<%= i%>"
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
             <!--delete admin test start-->
                             <div class="modal fade" id="admdelet" tabindex="-1" aria-labelledby="admdelet" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="DeleteAdminServlet" method="Get">
                                            
                                            
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="admdelet">Do you want to Delete?</h5>
                                            <input type="hidden" name="aid" id="pass_adm_id">
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                             <button type="submit" class="btn btn-danger" >Delete</button>
                                        </div>
                                            </form>
                                    </div>
                                </div>
                            </div>
                                                <!--deletre admin end?-->
                                                                                
                                                                                
                                                                                
                                                <!-- Logout  started  -->
                                                <div
                                                    class="modal fade"
                                                    id="logout"
                                                    tabindex="-1"
                                                    aria-labelledby="exampleModalLabel"
                                                    aria-hidden="true"
                                                    >
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
                                                                <button
                                                                    type="button"
                                                                    class="btn-close"
                                                                    data-bs-dismiss="modal"
                                                                    aria-label="Close"
                                                                    ></button>
                                                            </div>
                                                            
                                                            <div class="modal-body">
                                                                <p>Do you want to Logout?</p>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button
                                                                    type="button"
                                                                    class="btn btn-secondary"
                                                                    data-bs-dismiss="modal"
                                                                    >
                                                                    Close
                                                                </button>
                                                                <a type="button" class="btn btn-danger" href="Adminlogout"
                                                                   >Logout</a
                                                                >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Logout  ended  -->
                                            </div>
                                            <!-- right side contain display end  -->
                                        </div>

                                    </div>
                                </div>

                                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
                                <link
                                    href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
                                    rel="stylesheet"
                                    />
                                <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
                                <script>
                                    $(document).ready(function () {
                                        
                                        $('button[data-bs-toggle="pill"]').on("show.bs.tab", function (e) {
                                            localStorage.setItem("activeTab", $(e.target).attr("id"));
                                        });
                                        
                                        var activeTab = localStorage.getItem("activeTab");
                                        if (activeTab) {
                                            $('#v-pills-tab button[id="' + activeTab + '"]').tab("show");
                                        }
                                        
//                                        delete modewl code
//                                                
                                        
                                         
//                                         delete mechnic
                                                      
                                            $('.del_mec').click(function (e){
                                             e.preventDefault();
                                             
                                             var mec_id = $(this).closest('tr').find('.mec_id').text();
                                             
                                             $('#pass_mec_id').val(mec_id);
                                             $('#mecdelet').modal('show');
                                         
                                         });
                                         
//                                         delete admin
                                          $('.del_adm').click(function (e){
                                             e.preventDefault();
                                             
                                             var adm_id = $(this).closest('tr').find('.adm_id').text();
                                             
                                             $('#pass_adm_id').val(adm_id);
                                             $('#admdelet').modal('show');
                                         
                                         });
                                         
//                                         delete customer
                                         $('.del_cus').click(function (e){
                                             e.preventDefault();
                                             
                                             var cus_id = $(this).closest('tr').find('.cus_id').text();
                                             
                                             $('#pass_cus_id').val(cus_id);
                                             $('#cusdelet').modal('show');
                                         
                                         });
                                         
//                                         delete bike
    
                                            $('.del_bike').click(function (e){
                                             e.preventDefault();
                                             
                                             var b_id = $(this).closest('tr').find('.bike_id').text();
                                             
                                             $('#pass_bike_id').val(b_id);
                                             $('#bikedelete').modal('show');
                                         
                                         });
                                         
//                                         delete servicing history
                                           
                                           $('.del_ser').click(function (e){
                                             e.preventDefault();
                                             
                                             var s_id = $(this).closest('tr').find('.ser_id').text();
                                             
                                             $('#pass_ser_id').val(s_id);
                                             $('#serdelete').modal('show');
                                         
                                         });
                                         
                                         
//                             search jqury code for accepted booking table 
                                          $('#acbSerInp').on("keyup", function(){
                                              var acbvalue = $(this).val().toLowerCase();
                                               $('#acbSertbl  tr').filter(function(){
                                                  $(this).toggle($(this).text().toLowerCase().indexOf(acbvalue)> -1); 
                                               });
                                          });             
                                         
                                         
 //                       search jqury code for customer table 
                                          $('#cusSerInput').on("keyup", function(){
                                              var cusvalue = $(this).val().toLowerCase();
                                               $('#cusSertbl tr').filter(function(){
                                                  $(this).toggle($(this).text().toLowerCase().indexOf(cusvalue)> -1); 
                                               });
                                          });
                                          
  //                       search jqury code for online booking  table 
                                          $('#obSerInp').on("keyup", function(){
                                              var obvalue = $(this).val().toLowerCase();
                                               $('#obSertbl tr').filter(function(){
                                                  $(this).toggle($(this).text().toLowerCase().indexOf(obvalue)> -1); 
                                               });
                                          });  
                                          
  //                       search jqury code for bike table 
                                          $('#bikeSerInput').on("keyup", function(){
                                              var bikevalue = $(this).val().toLowerCase();
                                               $('#bikeSertbl tr').filter(function(){
                                                  $(this).toggle($(this).text().toLowerCase().indexOf(bikevalue)> -1); 
                                               });
                                          });  
        //                       search jqury code for servicing history table 
                                          $('#servcSerInp').on("keyup", function(){
                                              var servicvalue = $(this).val().toLowerCase();
                                               $('#servcSertbl tr').filter(function(){
                                                  $(this).toggle($(this).text().toLowerCase().indexOf(servicvalue)> -1); 
                                               });
                                          });  
        //                       search jqury code for Feedback table 
                                          $('#feedbSerInp').on("keyup", function(){
                                              var fbvalue = $(this).val().toLowerCase();
                                               $('#feedbSertbl tr').filter(function(){
                                                  $(this).toggle($(this).text().toLowerCase().indexOf(fbvalue)> -1); 
                                               });
                                          });  
         //                       search jqury code for mechanic table 
                                          $('#mecSerInp').on("keyup", function(){
                                              var mvalue = $(this).val().toLowerCase();
                                               $('#mecSertbl tr').filter(function(){
                                                  $(this).toggle($(this).text().toLowerCase().indexOf(mvalue)> -1); 
                                               });
                                          });  
      //                       search jqury code for admin table 
                                          $('#admSerInp').on("keyup", function(){
                                              var avalue = $(this).val().toLowerCase();
                                               $('#admSertbl tr').filter(function(){
                                                  $(this).toggle($(this).text().toLowerCase().indexOf(avalue)> -1); 
                                               });
                                          });  
                                         
                                         
                                         
                                         
                                         
                                    });
                                </script>
                                <script>
                                    var el = document.getElementById("wrapper");
                                    var toggleButton = document.getElementById("menu-toggle");
                                    toggleButton.onclick = function () {
                                        el.classList.toggle("toggled");
                                    };
                                </script>
                        </body>
                    </html>
