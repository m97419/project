const userStr = sessionStorage.getItem("user")
const user = JSON.parse(userStr)

document.getElementById("text").innerHTML = `wellcome to ${user.firstName} ${user.lastName}!!!!`

