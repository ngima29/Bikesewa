<%@page import="java.sql.Connection"%>
<%@page import="com.bikesewa.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/footer.css" rel="stylesheet" type="text/css"/>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
   
        
  </head>
  <body>
 
        <div class="container-fluid banner">
		<div class="row">
			<div class="col-md-12">

<%@include file="navbar.jsp" %>
    </div>
			</div>
			<div class="col-md-8 offset-md-2 info">
<!--			 <h1 class="text-center">SPITAL</h1>-->
				<p class="text-center">
					Book your servicing online
				</p>  
<!--				<a href="#" class="btn btn-md text-center">Book your servicing online </a>-->
                            
			</div>
		</div>
    <footer>
      <div class="main-content">
        <div class="left box">
          <h2>About us</h2>
          <div class="content">
            <p> Bike Sewa is web application where user can book there bike servicing 
                through online and can view old servicing records like parts changed, km,
                amount etc using this application user also can view their next servicing date or km.  </p>
            <div class="social">
              <a href="#"><span class="fab fa-facebook-f"></span></a>
              <a href="#"><span class="fab fa-twitter"></span></a>
              <a href="#"><span class="fab fa-instagram"></span></a>
              <a href="#"><span class="fab fa-youtube"></span></a>
            </div>
          </div>
        </div>

        <div class="center box">
          <h2>Address</h2>
          <div class="content">
            <div class="place">
              <span class="fas fa-map-marker-alt"></span>
              <span class="text"> Kapan10, Budhanilkantha</span>
            </div>
            <div class="phone">
              <span class="fas fa-phone-alt"></span>
              <span class="text">+977 01-0000000</span>
            </div>
            <div class="email">
              <span class="fas fa-envelope"></span>
              <span class="text">bikeSewa@gmail.com</span>
            </div>
          </div>
        </div>

        <div class="right box">
          <h2>Contact us</h2>
          <div class="content">
            <form action="#">
              <div class="email">
                <div class="text">Email *</div>
                <input type="email" required>
              </div>
              <div class="msg">
                <div class="text">Message *</div>
                <textarea rows="4" cols="50" name="comment">Enter text here...</textarea>
              </div>
              <div>
               
                <a class=" btn btn-success btn-lg me-5"  href="#">Send</a>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="bottom">
        <center>
            <span class="credit">Created By <a href="#" class="text-info">Bike Sewa</a> | </span>
          <span class="far fa-copyright"></span><span> 2022 All rights reserved.</span>
        </center>
      </div>
    </footer>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="js/bikesewa.js" type="text/javascript"></script>
  </body>
</html>