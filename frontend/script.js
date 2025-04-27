initLoginPage()
// Page connexion/inscription
function initLoginPage() {
    const tabButtons = document.querySelectorAll('.tab-btn');
    const authForms = document.querySelectorAll('.auth-form');
    
    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            const tab = button.dataset.tab;
            
            // Activer le bouton de l'onglet
            tabButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            
            // Afficher le formulaire correspondant
            authForms.forEach(form => form.classList.remove('active'));
            document.getElementById(`${tab}-form`).classList.add('active');
        });
    });

}

const filter = document.getElementById("completion")

filter.addEventListener("keyup", (e)=>{
    const text = e.target.value
    const components = document.querySelectorAll(".component-card")
    components.forEach(element => {
        if(!element.children.item(0).textContent.includes(text)){
            element.style.display = "none"
        }else{
            element.style.display = "flex"
        }
    });

})