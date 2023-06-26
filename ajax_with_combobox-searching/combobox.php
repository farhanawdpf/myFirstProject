<?php 
$db = new mysqli('localhost','root','','sms_1');
?>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<style type="text/css"> 
		.product{position:relative}
		#suggest{    
			position: absolute;
			margin: 0;
			padding: 0;
			list-style: none;
			background: #ddd;
			width: 173px;
			left: 100px;
		}
		#suggest li{
			padding: 8px 10px;
			border-bottom: 1px dashed #fff;
			cursor:pointer;
		}
		#suggest li:hover{background:#555;color:#fff;border-bottom: 1px dashed #000}
	
	</style>
</head>
<body>
	
	<form action="#" method="post">
		<table> 
			<tr> 
				<td><label for="product">Product</label></td>
				<td>
					<select name="product" id="product">
						<option value=""></option>
						<?php 
							$product = $db->query("select p.id,p.name from product p, purchase pur where p.id=pur.product_id ");
							while(list($_id,$_name)=$product->fetch_row()){
								echo "<option value='$_id'>$_name</option>";
							}
						?>
					</select>
				</td>
				<td><label for="price">price</label></td>
				<td><input type="text" name="price" id="price" /></td>
				<td><label for="qty">Qty</label></td>
				<td><input type="text" name="qty" id="qty" /></td>
				<td><input type="text" name="uom" id="uom" /></td>
			</tr>
		</table>
	</form>
	<br />
	<br />
	<div class="product"> 
		<label for="sproduct">Search product</label>
		<input type="text" id="sproduct" />
		<ul id="suggest"></ul>
		<br /> 
		<br /> 
		<br /> 
		<div class="pdetails"> 
			
		</div>
	</div>
	
	
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"> 
		$(function(){
			$("#product").change(function(){
				pid = $(this).val();
				if(pid != ""){
					$.ajax({
						type:"post",
						url:"ajax_data.php",
						data:{"pid":pid},
						success:function(data){
							//alert(data)
							data.forEach(function(obj,index){
								$("#price").val(obj.price);
								$("#qty").val(obj.qty);
								$("#uom").val(obj.uom);
							});
						}
					});
				}
			});
			
			$("#sproduct").keyup(function(){
				pname = $(this).val();
				$.ajax({
					type:"post",
					url:"ajax_data.php",
					data:{"pname":pname},
					success:function(data){
						var suggest="";
						data.forEach(function(obj,index){
							suggest += "<li>"+obj.name+"</li>";
						});
						$("#suggest").html(suggest);
						$('#suggest').fadeIn();
					}
				});
			});
			
			$(document).on('click','#suggest>li', function(){
				$('#sproduct').val($(this).text());
				$('#suggest').fadeOut();
				$.ajax({
					type:"post",
					url:"ajax_data.php",
					data:{"product":$(this).text()},
					success:function(data){
						var html = "";
						data.forEach(function(obj,index){
							html += "<table border='1' style='border-collapse:collapse'>";
							html +=	"<tr><th>id</th><th>Name</th><th>uom</th><th>date</th><th>Manufacturer</th><th>category</th><th>Type</th><th>Aded by</th></tr>";
							html +=	"<tr><td>"+obj.id+"</td><td>"+obj.name+"</td><td>"+obj.uom+"</td><td>"+obj.date+"</td><td>"+obj.mid+"</td><td>"+obj.cid+"</td><td>"+obj.iid+"</td><td>"+obj.uid+"</td></tr>";
							html += "</table>";
						});
						$(".pdetails").html(html);				
					}
				});
			});
			
			
		});
	</script>
</body>
</html>
