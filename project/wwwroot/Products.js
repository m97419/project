
const getCartegories = async () => {
    try {
        const res = await fetch("api/Categories")
        const Categories = await res.json()
        return Categories
    }
    catch (ex) {
        console.log(ex)
    }
}

const showCategories = async () => {
    const Categories = await getCartegories()
    const tmpCategory = document.getElementById("temp-category")
    for (let i = 0; i < Categories.length; i++) {
        const cln = tmpCategory.content.cloneNode(true)
        cln.querySelector("label").for = Categories[i].categoryName
        cln.querySelector(".opt").value = Categories[i].categoryName
        cln.querySelector(".opt").id = "id"+Categories[i].categoryId
        cln.querySelector(".OptionName").innerText = Categories[i].categoryName
        document.getElementById("categoryList").appendChild(cln)
    }
}

const getProducts = async (categoriesId, desc, minPrice, maxPrice) => {
    let url = `api/Products?`
    if (categoriesId) {
        for (let i = 0; i < categoriesId.length; i++) {
            url += `&categoriesId=${categoriesId[i]}&`;
        }
    }
    if (desc) url += `desc=${desc}&`
    if (minPrice) url += `minPrice=${minPrice}&`
    if (maxPrice) url += `maxPrice=${maxPrice}`
    try {
        const res = await fetch(url)
        if (res.ok) {
            const products = await res.json()
            return products
        }
    }
    catch (ex) {
        console.log(ex)
    }
    return []
}

const showProducts = (products) => {
    document.getElementById("PoductList").innerHTML = ""
    const tmpProduct = document.getElementById("temp-card")
    for (let i = 0; i < products.length; i++) {
        const cln = tmpProduct.content.cloneNode(true)
        cln.querySelector("img").src = "./Images/"+products[i].image
        cln.querySelector("h1").innerText = products[i].categoryName
        cln.querySelector(".price").innerText = products[i].price + "$"
        cln.querySelector(".description").innerText = products[i].description
        document.getElementById("PoductList").appendChild(cln)
    }
}

const filterProducts = async () => {
    const Categories = await getCartegories()
    const categoriesId = []
    for (let i = 0; i < Categories.length; i++) {
        if (document.querySelector(`#id${Categories[i].categoryId}`)?.checked) {
            categoriesId.push(Categories[i].categoryId)
        }
    }
    const desc = document.querySelector("#nameSearch").value
    const minPrice = document.querySelector("#minPrice").value
    const maxPrice = document.querySelector("#maxPrice").value
    const products = await getProducts(categoriesId, desc, minPrice, maxPrice)
    showProducts(products)
}

showCategories()
filterProducts()