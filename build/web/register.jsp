
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
 
    
    <script>
// Defining a function to display error message
function printError(elemId, hintMsg) {
    document.getElementById(elemId).innerHTML = hintMsg;
}

// Defining a function to validate form 
function validateForm() {
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
    
    // Prevent the form from being submitted if there are any errors
    if((nameErr || emailErr || mobileErr || addressErr || genderErr || passwordErr ) == true) {
       return false;
    } else {
        // Creating a string from input data for preview
        var dataPreview = "You've entered the following details: \n" +
                          "Full Name: " + name + "\n" +
                          "Email Address: " + email + "\n" +
                          "Mobile Number: " + mobile + "\n" +
                          "Address: " + address + "\n" +
                          "Gender: " + gender + "\n";
        
        // Display input data in a dialog box before submitting the form
        alert(dataPreview);
    }
};
</script> 
 
  </head>
    
    <body>
     
        <main class="d-flex align-items-center" style="height: 100vh">
 <div class="container">
   <div class="row mx-auto">
     <div class="col-md-6 offset-md-2">
       <div class="card" >
           <div class="card-header bg-success text-white text-center">
            
               <i class="fa fa-user-plus fa-3x" ></i>
               <h1 class="d-flex justify-content-center">Register</h1>

            </div>
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
      <div class="card-body">
         <!--?####FORM-->
 <form name="contactForm" onsubmit="return validateForm()" action="RegisterServlet" method="POST" >
       
 <div class="row">
  <div class="col">
    
      <input type="text" class="form-control" placeholder="Full Name" name="user_name" autocomplete="off" maxlength="15"required>
      <span class="error text-danger font-weight-bold" id="nameErr"></span>
  </div>
  <div class="col">
    <input type="email" class="form-control" placeholder="Email" name="user_email" autocomplete="off" required>
    <span class="error text-danger font-weight-bold" id="emailErr"></span>
  </div>
</div>
         <br>
 <div class="row">
  <div class="col">
    <input type="text" maxlength="10" class="form-control" placeholder="Phone" name="user_phone" autocomplete="off" required>
    <span class="error text-danger font-weight-bold" id="mobileErr"></span>
  </div>
  <div class="col">
 
  <div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="gender" value="Male" required>
  <label class="form-check-label">Male</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="gender" value="Female" required>
  <label class="form-check-label" >Female</label>
</div>
<span class="error text-danger font-weight-bold" id="genderErr"></span>
  </div>
   </div>   
  
   <br>
<div class="row">
  <div class="col">
    <input type="text" class="form-control" placeholder="Address" name="user_address" autocomplete="off" maxlength="15" required>
    <span class="error text-danger font-weight-bold" id="addressErr"></span>
  </div>
  <div class="col">
  <input type="password" class="form-control" placeholder="Password" name="user_password" autocomplete="off"  required>
<!--    <span class="error text-danger font-weight-bold" id="passwordErr"></span>-->
  </div>
</div>  
   <br> 

     <div class="d-flex ">         
         <button  id="sumbimt-btn" type="submit" class="btn btn-danger me-5" name="submit">Submit</button>
          <div>Already have an account ? <a href="login.jsp">Login </a></div> 
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
         
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  
     
    </body>
</html>
