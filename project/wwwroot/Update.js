let user

const loaDetails = () => {
    const userStr = sessionStorage.getItem("user")
    user = JSON.parse(userStr)
    document.getElementById("text").innerHTML = ` ${user.firstName} ${user.lastName} `
    document.getElementById("newFirstName").value = `${user.firstName}`
    document.getElementById("newLastName").value = `${user.lastName}`
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
    else if (userName.length > 30 || password.length > 15) {
        alert("Not valid input")
    }
    else {
        if (await getPasswordScore(password) > 2) {
            const updateUser = {
                email: userName,
                password: password,
                firstName: firstName,
                lastName: lastName
            }
            try {
                const res = await fetch(`api/Users/${user.userId}`, {
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
                    sessionStorage.user = JSON.stringify({ userId: user.userId, firstName: updateUser.firstName, lastName: updateUser.lastName })
                    window.location.href = 'Products.html'
                }
            }
            catch (ex) {
                console.log(ex)
            }
        }
    }
}

const checkThePassword = async () => {
    const password = document.getElementById("newPassword").value
    if (!password) {
        document.getElementById("level").value = 0
    }
    else {
        score = await getPasswordScore(password)
        document.getElementById("level").value = score
    }
}

const getPasswordScore = async (password) => {
    try {
        const res = await fetch(`api/Validations`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(password)
        })
        if (!res.ok) {
            alert("sorry, we have an error")
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