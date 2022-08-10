
function add_to_cart(pid, pname, price) {



	let cart = localStorage.getItem("cart");
	if (cart == null) {

		let products = [];
		let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };

		products.push(product);
		console.log(products);
		localStorage.setItem("cart", JSON.stringify(products));
		console.log("product added first time");
		showToast("Product is added to cart");

	}
	else {

		let pcart = JSON.parse(cart);

		let oldProduct = pcart.find((item) => item.productId == pid)

		if (oldProduct) {

			oldProduct.productQuantity = oldProduct.productQuantity + 1;
			pcart.map((item) => {

				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}
			})

			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product quantity increase");
				showToast(oldProduct.productName + "product quantity increase");

		}
		else {
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
			pcart.push(product);

			localStorage.setItem("cart", JSON.stringify(pcart));

			console.log("product is added");
			showToast("product is added");
			console.log(pcart);
		}

	}
updateCart();
}


function updateCart() {
	console.log("update cart");

	let cartString = localStorage.getItem("cart");

	let cart = JSON.parse(cartString);
	
	if (cart == null || cart.length == 0) {
		console.log("cart is empty !!");
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3>Cart does not have any items </h3>");
		$(".checkout-btn").attr('disabled',true);
	}
	else {
		console.log(cart);
		
			$(".cart-items").html(` ${cart.length} `);
			 let totalPrice =0 ;
			let table  = `
			
			<table class='table'>
			<thead class='thead-light'>
			<tr>
			<th>Item Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total Price</th>
			<th>Action</th>
			
			</tr>
			</thead>
			
			
			`;
			
			cart.map((item)  =>{
			table += `
			<tr>
			<td>${item.productName}</td>
				<td>${item.productPrice}</td>
					<td>${item.productQuantity}</td>
						<td>${item.productQuantity* item.productPrice}</td>
						<td><button class="btn btn-danger btn-sn" onclick = "deleteItemFromCart(${item.productId})" >Remove </button></td>
						
			</tr>
			
			
			`
			
			 totalPrice +=  item.productQuantity* item.productPrice;
			
			})
		
			table  = table + `
			<tr><td colspan='5' class="text-right font-weight-bold">Total Price : ${totalPrice}</td></tr>
			</table>`
				$(".cart-body").html(table);
				$(".checkout-btn").attr('disabled',false);
	}

}


function deleteItemFromCart(pid){
console.log(pid)
let cart = JSON.parse(localStorage.getItem('cart'));

let newCart  = cart.filter((item) => item.productId != pid)

console.log(newCart);
localStorage.setItem('cart',JSON.stringify(newCart))

updateCart();

showToast("Product is remove from cart");

}



$(document).ready(function (){
updateCart();
})



function showToast(content){
$("#toast").addClass("display");
$("#toast").html(content);
setTimeout(()=>{
$('#toast').removeClass("display");
},2000);
}



function gotoCheckout() {
window.location.href  ="checkout.jsp";
}