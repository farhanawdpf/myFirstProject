<?php
      
	  if(isset($_POST["btnDelete"])){
		  $product_id=$_POST["txtId"];
		  
		  $db->query("delete from products where id='$product_id'");
		  echo "Deleted";
		  
	   }
	   
   $con_table=$db->query("select p.id,p.name,p.new_price,p.old_price,p.uom,c.name from products p,category c where c.id=p.category_id");
   
   echo "<table class='table'>";
   echo "<tr><th>Id</th><th>Name</th><th>New Price</th><th>Old Price</th><th>UoM</th><th>Category</th></tr>";
   
   while(list($id,$name,$new_price,$old_price,$uom,$category)=$con_table->fetch_row()){
	   
	   //$added_on=date("d M Y h:i A",strtotime($added_on));
	   
	   
	 echo "<tr><td>$id</td><td>$name</td><td>$new_price</td><td>$old_price</td><td>$uom</td><td>$category</td></tr>";  
   }
   
   echo "</table>";
   
?>