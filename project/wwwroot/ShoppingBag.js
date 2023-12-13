
let bag

const loadBag = () => {
    bag = JSON.parse(sessionStorage.getItem("myBag"))
    if (!bag || bag == [])
        document.getElementById("todoOrder").style.visibility = "hidden"
    showOrder()
}

const showOrder = () => {
    const tmpOrder = document.getElementById("temp-row")
    let totalAmount=0, count=0
    for (let i = 0; i < bag.length; i++) {
        const cln = tmpOrder.content.cloneNode(true)
        cln.querySelector(".item-row").id = bag[i].productId
        cln.querySelector(".image").src = "./Images/" + bag[i].image
        cln.querySelector(".itemNumber").innerText = ` ${bag[i].count} items`
        cln.querySelector(".itemName").innerText = bag[i].categoryName
        cln.querySelector(".price").innerText = bag[i].price * bag[i].count + "$"
        cln.querySelector(".priceTo1").innerText = bag[i].price + "$ for one item"
        cln.querySelector(".DeleteButton").addEventListener('click', () => { deleteProduct(bag[i]) })
        count += bag[i].count
        totalAmount += bag[i].price * bag[i].count
        document.getElementById("table").appendChild(cln)
    }
    document.getElementById("itemCount").innerText = count
    document.getElementById("totalAmount").innerText = totalAmount
}

const deleteProduct = (product) => {
    bag = bag.filter(p => p.productId != product.productId)
    document.getElementById("table").removeChild(document.getElementById(product.productId))
    bag = JSON.stringify(bag)
    sessionStorage.myBag = bag
}

const toDoOrder = async () => {
    const user = sessionStorage.getItem("user")
    if (!user) {
        window.location.href = 'login.html'
    }
    const order = {
        orderDate: new Date(),
        orderSum: 0,
        userId: JSON.parse(user).userId,
        orderItems: []
    }
    let sum = 0
    for (let i = 0; i < bag.length; i++) {
        order.orderItems.push({ Quantity: bag[i].count, ProductId: bag[i].productId })
        sum += bag[i].price * bag[i].count
    }
    order.orderSum = sum
    try {
        const res = await fetch('api/Orders', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(order)
        })
        if (!res.ok) {
            alert("sorry, we had an error, the order didn't complited")
        }
        else {
            const afterOrder = await res.json()
            alert(`the order complited succesfully!!`)
            sessionStorage.myBag = "[]"
            document.getElementById("todoOrder").style.visibility="hidden"
        }
    }
    catch (ex) {
        console.log(ex)
    }
}