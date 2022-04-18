<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
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
         
        <div class="container text-center">
       
            <div class="img h-25">
                <img src="image/error.png" class="rounded mx-auto d-block img-thumbnail" alt="...">
            </div>
    
            <h3 class="display-3">Sorry ! Something went wrong ...</h3>
            <br>
            <div class="row">
                  <div class="col align-self-center">
                <%= exception%>
            </div>
             </div>
            <br>
          
            <a href="index.jsp" class="btn btn-primary btn-lg text-white mt-3">Home </a>
        </div>


    </body>
</html>
