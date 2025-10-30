/**
 * Prime Properties - main.js
 * JavaScript principal para manejar interactividad básica del sitio.
 * Autor: Ana Fuentes
 * Año: 2025
 */

/**
 * Función que muestra una alerta cuando se envía el formulario de contacto.
 * @param {Event} e - Evento del formulario.
 */
function handleFormSubmit(e) {
  e.preventDefault(); // Evita que recargue la página
  alert("Mensaje enviado correctamente. Gracias por contactarnos.");
  e.target.reset(); // Limpia el formulario
}

/**
 * Asocia eventos a los elementos de la página una vez que se ha cargado el DOM.
 */
function initEventListeners() {
  const form = document.querySelector("form");
  if (form) {
    form.addEventListener("submit", handleFormSubmit);
  }

  const navLinks = document.querySelectorAll("nav a");

  navLinks.forEach((link) => {
    link.addEventListener("click", (e) => {
      e.preventDefault();
      alert(`Has hecho clic en: ${link.textContent}`);
    });
  });
}

/**
 * Punto de entrada del script.
 */
document.addEventListener("DOMContentLoaded", () => {
  console.log("Página cargada correctamente.");
  initEventListeners();
});
