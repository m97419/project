
const loaDetails = () => {
    const userStr = sessionStorage.getItem("user")
    const user = JSON.parse(userStr)
    document.getElementById("text").innerHTML = `${user.firstName} ${user.lastName}`

}

const update = async () => {
    const userStr = sessionStorage.getItem("user")
    const user = JSON.parse(userStr)
    const userName = document.getElementById("newName").value
    const password = document.getElementById("newPassword").value
    const firstName = document.getElementById("newFirstName").value
    const lastName = document.getElementById("newLastName").value
    if (!password || !userName) {
        alert("please enter name and password")
    }
    else {
        if (await getPasswordScore(password) > 2) {
            const updateUser = {
                name: userName,
                password: password,
                firstName: firstName,
                lastName: lastName
            }
            try {
                const res = await fetch(`api/Users/${user.id}`, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(updateUser)
                })
                if (!res.ok) {
                    alert("sorry, we were an error")
                }
                else {
                    window.location.href = 'Products.html'
                }
            }
            catch (ex) {
                console.log(ex)
            }
        }
    }
}

const getPasswordScore = async (password) => {
    try {
        const res = await fetch(`api/Users/${password}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: null
        })
        if (!res.ok) {
            alert("sorry, we were an error")
        }
        else {
            const score = await res.json()
            return score;
        }
    }
    catch (ex) {
        console.log(ex)
    }
}