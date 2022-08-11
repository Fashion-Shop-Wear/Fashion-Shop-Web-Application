


<style>

input,button{
	min-height:40px;
	margin-top:10px;
	border:none;
	border-radius:5px;
}

button{
	background-color:black;
	color:white;
	min-width:100px;
	cursor:pointer;
}

center div{
	border-radius:5px;
	padding-top:10px;
	padding-bottom:10px;
	box-shadow:0px 0px 12px 0px grey;
}

</style>

<center>

<h1>Forms</h1>
<diV style="background-color:aliceblue;width:400px">
<h3>Create Product</h3>
<form method="post" action="add_product">
	<input type="text" name="product_name" required>
	<br>
	<input type="text" name="product_price" required>
	<br>
	<button type="submit" name="store_product">Submit</button>
</form>



<h3>Create Category</h3>
<form method="post" action="add_product">
	<input type="text" name="product_name" required>
	<br>
	<input type="text" name="product_price" required>
	<br>
	<button type="submit" name="create_category">Submit</button>
</form>

</div>
<center>