<?php
require_once("config.php");
?>
<!doctype html>
<html ng-app="myApp">
<head>
<meta charset="utf-8">
<title>{{title}}</title>
<script src="js/angular.min.js"></script>
<script src="js/ngStorage.js"></script>
<script src="js/angular-route.min.js"></script> 
    
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<?php include("css_basic.php");?>
</head>

<body>
<div class="container-fluid">

   <div class="row">
     <div class="col-md-10">
        <?php
        include("main_menu.php");
		?>
     </div>
    <div class="col-md-2">
      <strong>Your Cart: tk{{total}}</strong> 
    </div>
   </div>
   
   <div class="jumbotron">
   <image src="img/5760065_orig.jpg"  width="100%" hight="30px"/>
   <h3>Welcome to my Gift Shop<h3>
  <small> <i>Our online gift shop offers various type of home deliveries like flower, plants, Gifts,Teddys, Chocolates etc., for birthday,anniversary or any other special ...</i></small>
   </div>
    
   </div>
   
  <div class="row">
  
     <div class="col-md-2">
      <?php include("nav.php");?>
     </div>
     
      <div class="col-md-10">
        <div ng-view></div> 
      </div>
  
      
      
  </div><!--end row-->
  
  
  <div class="row">
    <div class="col-md-12">copyright&copy; 2018</div>
  </div>
  
</div>

<script src="app.js"></script>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>