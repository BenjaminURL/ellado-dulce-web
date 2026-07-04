//=====================================
// OPCIONES DEL CONFIGURADOR
//=====================================
const opciones = {
    base: [
        { id: 1, nombre: "Redondo", precio: 0, imagen: "img/opciones/redondo.png" }
    ],
    sabor: [
        { id: 1, nombre: "Vainilla", precio: 0, imagen: "img/opciones/vainilla.png" },
        { id: 2, nombre: "Chocolate", precio: 1, imagen: "img/opciones/chocolate.png" }
    ],
    cobertura: [
        { id: 1, nombre: "Chantilli", precio: 0, imagen: "img/opciones/chantilly.png" },
        { id: 2, nombre: "Fondant", precio: 3, imagen: "img/opciones/fondant.png" }
    ],
    decoracion: [
        { id: 1, nombre: "Flores", precio: 2, imagen: "img/opciones/flores.png" },
        { id: 2, nombre: "Chispas", precio: 1, imagen: "img/opciones/chispas.png" }
    ]
};

//=====================================
// SELECCIÓN ACTUAL Y PASO ACTUAL
//=====================================
let seleccion = {
    base: 1,
    sabor: 1,
    cobertura: 1,
    decoracion: 1
};

let pasoActual = 1; // Controla qué pantalla ve el usuario
const precioBase = 19.99;

//=====================================
// CARRITO
//=====================================
let carrito = JSON.parse(localStorage.getItem("carrito")) || [];

//=====================================
// CREA LAS TARJETAS
//=====================================
function crearTarjetas(categoria, contenedorID){
    const contenedor = document.getElementById(contenedorID);
    if(!contenedor) return;
    contenedor.innerHTML = "";

    opciones[categoria].forEach(opcion =>{
        const tarjeta = document.createElement("div");
        tarjeta.className = "option-card";
        tarjeta.dataset.id = opcion.id;

        tarjeta.innerHTML = `
            <div class="option-info">
                <h3>${opcion.nombre}</h3>
                <p>+ B/.${opcion.precio.toFixed(2)}</p>
            </div>
        `;

        tarjeta.addEventListener("click", function(){
            seleccionarOpcion(categoria, opcion.id);
        });

        contenedor.appendChild(tarjeta);
    });
}

//=====================================
// SELECCIONAR OPCIÓN
//=====================================
function seleccionarOpcion(categoria, id){
    seleccion[categoria] = id;
    actualizarTarjetas();
    actualizarResumen();
    actualizarImagen();
}

//=====================================
// CONTROL DE PASOS (NAVEGACIÓN)
//=====================================
function cambiarPaso(direccion) {
    // Ocultamos el paso actual
    document.getElementById(`step${pasoActual}`).classList.remove("active");
    
    // Calculamos el nuevo paso
    pasoActual += direccion;
    
    // Mostramos el nuevo paso
    document.getElementById(`step${pasoActual}`).classList.add("active");
}

//=====================================
// CARGAR TODO
//=====================================
function iniciarConfigurador(){
    crearTarjetas("sabor","cardsSabor");
    crearTarjetas("cobertura","cardsCobertura");
    crearTarjetas("decoracion","cardsDecoracion");

    actualizarTarjetas();
    actualizarResumen();
    actualizarImagen();

    // El botón se asigna una vez que carga el DOM
    const btnAgregar = document.getElementById("btnAgregar");
    if(btnAgregar) {
        btnAgregar.addEventListener("click", agregarAlCarrito);
    }
    actualizarCarrito();
}

//=====================================
// ACTUALIZA TARJETAS
//=====================================
function actualizarTarjetas(){
    const categorias = ["sabor", "cobertura", "decoracion"];

    categorias.forEach(categoria=>{
        const contenedor = document.getElementById(
            "cards" + categoria.charAt(0).toUpperCase() + categoria.slice(1)
        );
        
        if (!contenedor) return;

        const tarjetas = contenedor.querySelectorAll(".option-card");
        tarjetas.forEach(tarjeta=>{
            if(Number(tarjeta.dataset.id) === seleccion[categoria]){
                tarjeta.classList.add("selected");
            } else {
                tarjeta.classList.remove("selected");
            }
        });
    });
}

//=====================================
// CALCULAR PRECIO
//=====================================
function calcularPrecio(){
    let total = precioBase;
    total += opciones.base[seleccion.base-1].precio;
    total += opciones.sabor[seleccion.sabor-1].precio;
    total += opciones.cobertura[seleccion.cobertura-1].precio;
    total += opciones.decoracion[seleccion.decoracion-1].precio;
    return total;
}

//=====================================
// OBTENER RUTA DE LA IMAGEN
//=====================================
function obtenerRutaImagen(){
    return "imagenes/Pasteles/" +
        obtenerOpcion("base").nombre + "_" +
        obtenerOpcion("sabor").nombre + "_" +
        obtenerOpcion("cobertura").nombre + "_" +
        obtenerOpcion("decoracion").nombre + ".png";
}

//=====================================
// ACTUALIZA RESUMEN
//=====================================
function actualizarResumen(){
    const categorias = ["sabor", "cobertura", "decoracion"];

    categorias.forEach(categoria=>{
        const opcion = obtenerOpcion(categoria);
        const elemento = document.getElementById(
            "txt" + categoria.charAt(0).toUpperCase() + categoria.slice(1)
        );
        
        if (elemento) {
            elemento.textContent = opcion.nombre;
        }
    });

    const total = calcularPrecio();
    const txtPrecio = document.getElementById("txtPrecio");
    if(txtPrecio) txtPrecio.textContent = "B/." + total.toFixed(2);
}

//=====================================
// ACTUALIZA IMAGEN
//=====================================
function actualizarImagen(){
    const preview = document.getElementById("previewCake");
    if(!preview) return;
    preview.style.opacity = 0;

    setTimeout(()=>{
        preview.src = obtenerRutaImagen();
        preview.style.opacity = 1;
    }, 150);
}

//=====================================
// CREAR PASTEL Y CARRITO
//=====================================
function crearPastel(){
    return {
        base: obtenerOpcion("base").nombre,
        sabor: obtenerOpcion("sabor").nombre,
        cobertura: obtenerOpcion("cobertura").nombre,
        decoracion: obtenerOpcion("decoracion").nombre,
        precio: calcularPrecio(),
        imagen: obtenerRutaImagen()
    };
}

function agregarAlCarrito(){
    const pastel = crearPastel();
    carrito.push(pastel);
    localStorage.setItem("carrito", JSON.stringify(carrito));
    actualizarCarrito();
    alert("Pastel agregado al carrito.");
}

function actualizarCarrito(){
    const cartCount = document.getElementById("cartCount");
    if(cartCount) cartCount.textContent = carrito.length;
}

function obtenerOpcion(categoria){
    return opciones[categoria][seleccion[categoria] - 1];
}

document.addEventListener("DOMContentLoaded", iniciarConfigurador);