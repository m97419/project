
const login = async () => {
    const userLogin = {
        Email: document.getElementById("userName").value,
        Password: document.getElementById("userPassword").value
    }
    try {
        const res = await fetch(`api/Users/?email=${userLogin.Email}&password=${userLogin.Password}`, {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }
        })
        if (!res.ok) {
            alert("the name isn't exist or the password is incorrect")
        }
        else {
            const user = await res.json()
            sessionStorage.setItem("user", JSON.stringify(user))
            window.location.href = 'Products.html'
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
        const user = {
            Email: name,
            Password: password,
            FirstName: document.getElementById("newUserFirstName").value,
            LastName: document.getElementById("newUserLastName").value
        }
        try {
            const res = await fetch('api/Users', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(user)
            })
            if (!res.ok) {
                alert("sorry, we had an error")
            }
            else {
                const afterUser = await res.json()
                alert(`${afterUser.firstName} ${afterUser.lastName} add succesfully!!`)
            }
        }
        catch (ex) {
            console.log(ex)
        }
    }
    else {
        alert("your password is weak")
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