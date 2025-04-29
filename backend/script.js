document.addEventListener("DOMContentLoaded", function () {
    initLoginPage();
    handleFormSubmissions();
});


function initLoginPage() {
    const tabButtons = document.querySelectorAll('.tab-btn');
    const authForms = document.querySelectorAll('.auth-form');

    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            const tab = button.dataset.tab;
            tabButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            authForms.forEach(form => form.classList.remove('active'));
            document.getElementById(`${tab}-form`).classList.add('active');

            const messageBox = document.getElementById("message");
            messageBox.textContent = "";
            messageBox.style.display = "none";
        });
    });
}


function handleFormSubmissions() {
    const loginForm = document.getElementById("login-form");
    const registerForm = document.getElementById("register-form");
    const messageBox = document.getElementById("message");

    const sendForm = (form) => {
        if (!form) return;
        form.addEventListener("submit", function (e) {
            e.preventDefault();

            const formData = new FormData(form);

            fetch("auth.php", {
                method: "POST",
                body: formData
            })
            .then(response => response.text()) // 🔥 D'abord convertir la réponse en texte
            .then(data => {
                // Ici "data" est vraiment du texte
                messageBox.textContent = "";
                messageBox.style.display = "none";
            
                if (data.startsWith("success:")) {
                    const role = data.split(":")[1];
            
                    if (role === "admin") {
                        setTimeout(() => {
                            window.location.href = "admin.html";
                        }, 2000);
                    } else if (role === "user") {
                        setTimeout(() => {
                            window.location.href = "index.html";
                        }, 2000);
                    }
                } else {
                    messageBox.textContent = data;
                    messageBox.style.display = "block";
                    messageBox.style.color = "red";
                }
            })
            .catch(error => {
                messageBox.textContent = "Erreur de communication avec le serveur.";
                messageBox.style.display = "block";
                messageBox.style.color = "red";
            });
            
        });
    };

    sendForm(loginForm);
    sendForm(registerForm);
}


