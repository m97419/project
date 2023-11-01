

const login = async () => {
    const userName = document.getElementById("userName").value
    const userPassword = document.getElementById("userPassword").value
    try {
        const res = await fetch(`api/Users?name=${userName}&password=${userPassword}`)

        if (!res.ok || res.status == 204) {
            alert("the name isn't exist or the password is incorrect")
        }
        else {
            const user = await res.json()
            sessionStorage.setItem("user", JSON.stringify(user))
            window.location.href = 'wellcom.html'
        }
    }
    catch (ex) {
        console.log(ex)
    }
}


const addUser = () => {
    document.getElementById("register").style.visibility = "initial"
}


const regist = async () => {
    const name = document.getElementById("newUserName").value
    const password = document.getElementById("newUserPassword").value
    if (!name) {
        alert("please enter your name")
    }
    else if (!password) {
        alert("please enter your password")
    }
    else if (await getPasswordScore(password) > 2) {
        const newUser = {
            name: name,
            password: password,
            firstName: document.getElementById("newUserFirstName").value,
            lastName: document.getElementById("newUserLastName").value
        }
        try {
            const res = await fetch('api/Users', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(newUser)
            })
            if (!res.ok) {
                alert("sorry, we were an error")
            }
            else {
                const user = await res.json()
                alert(`${user.firstName} ${user.lastName} add succesfully!!`)
            }
        }
        catch (ex) {
            console.log(ex)
        }
    }
}

const checkThePassword = async () => {
    const password = document.getElementById("newUserPassword").value
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


const toUpdate = () => {
    document.getElementById("updateDetails").style.visibility = "initial"
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
                    alert(`the details update succesfully!!`)
                }
            }
            catch (ex) {
                console.log(ex)
            }
        }
    }
}