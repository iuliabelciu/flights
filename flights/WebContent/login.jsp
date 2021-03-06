<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <link rel="stylesheet" href="css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="css/flights.css" />
 <script src='<c:url value="/js/lib/jquery-1.10.2.js"/>'> </script>
 <script src='<c:url value="/js/bootstrap.min.js"/>'> </script>
<title>Login Page</title>
<style>
.pure-button{
    color: #FFF; /* rgba not supported (IE 8) */
    border: none rgba(0, 0, 0, 0);  /*IE9 + everything else*/
    background-color: #FFB732;
    }
#err{
	color:red;
}
</style>
</head>
<body style="background-color: transparent;">
              <div class="modal-dialog">
                     <div class="modal-content">
                          
                           <!-- Header Section -->
                           <div class="modal-header">
                                  <h2>Please sign in</h2>
                                  <h4 id="err"><c:out value="${message}"></c:out></h4>
                           </div>                          
                           <!-- Body Section -->
                           <div class="modal-body">
                                  <form class="form col-md-12" method="post" action="LoginServlet">
                                         <input name="username" type="text" class="form-control input-lg" placeholder="Username" required autofocus />
                                         <input name="password" type="password" class="form-control input-lg" placeholder="Password" required />
                                         <br>                                        
                                         <button class="pure-button btn-lg btn-block">Sign In</button>
                                  </form>
                           </div>                          
                           <!-- Footer Section -->
                           <div class="modal-footer">
                                  <div class="col-md-12">                                      
                                  </div>
                           </div>
                     </div>
              </div>
</body>
</html>
