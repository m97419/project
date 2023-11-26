
const showOrder = () => {
    const tmpOrder = document.getElementById("temp-row")
    const bag = JSON.parse(sessionStorage.getItem("myBag"))
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
    let bag = JSON.parse(sessionStorage.getItem("myBag"))
    bag = bag.filter(p => p.productId != product.productId)
    document.getElementById("table").removeChild(document.getElementById(product.productId))
    bag = JSON.stringify(bag)
    sessionStorage.myBag = bag
}

showOrder()