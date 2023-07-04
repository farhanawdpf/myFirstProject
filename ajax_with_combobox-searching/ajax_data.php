<?php 
header('Content-Type: application/json');

$db = new mysqli('localhost','root','','sms_1');

if(isset($_POST['pid'])){
	$pid = $_POST['pid'];
	
	$product = $db->query("select id,uom,sum(qty),sum(price)/count(product_id) from purchase where product_id='$pid' group by product_id ");
	
	$data = array();
	while(list($_id,$_uom,$_qty,$_price )=$product->fetch_row()){
		$item = array("id"=>$_id,"uom"=>$_uom,"qty"=>$_qty,"price"=>$_price);
		array_push($data,$item);
	}
	echo json_encode($data);
}


if(isset($_POST['pname'])){
	$pname = $_POST['pname'];
	
	$product = $db->query("select id,name,uom,date,manufac_id,category_id,item_id,user_id from product where name LIKE '$pname%' ");
	
	$data = array();
	while(list($_id,$_name,$_uom,$_date,$_mid,$_cid,$_itemid,$_uid )=$product->fetch_row()){
		$item = array("id"=>$_id,"name"=>$_name,"date"=>$_date,"mid"=>$_mid,"cid"=>$_cid,"iid"=>$_itemid,"uid"=>$_uid);
		array_push($data,$item);
	}
	echo json_encode($data);
}
if(isset($_POST['product'])){
	$product = $_POST['product'];
	
	$product = $db->query("select p.id,p.name,p.uom,p.date,m.name mname,c.name cname,p.item_id,u.username from product p,manufacturer m,category c,user u where p.manufac_id = m.id and p.category_id=c.id and p.user_id=u.id and p.name ='$product' ");
	
	$data = array();
	while(list($_id,$_name,$_uom,$_date,$_mid,$_cid,$_itemid,$_uid )=$product->fetch_row()){
		$item = array("id"=>$_id,"name"=>$_name,"date"=>$_date,"mid"=>$_mid,"uom"=>$_uom,"cid"=>$_cid,"iid"=>$_itemid,"uid"=>$_uid);
		array_push($data,$item);
	}
	echo json_encode($data);
}
?>