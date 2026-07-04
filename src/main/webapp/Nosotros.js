// ========================================
// DATOS DEL EQUIPO - 5 MIEMBROS
// ========================================
const teamMembers = [
    {
        nombre: "Ashely Hernandez",
        rol: "...",
        descripcion: "...",
        imagen: "imagenes/equipo/ashely.jpg",
        cedula: "8-1021-1342",
        carrera: "Ingenieria de software"
    },
    {
        nombre: "Benjamin Romero",
        rol: "...",
        descripcion: "...",
        imagen: "imagenes/equipo/benjamin.jpg",
        cedula: "8-1025-1530",
        carrera: "Ingenieria de software"
    },
    {
        nombre: "Juan Bermudez",
        rol: "...",
        descripcion: "....",
        imagen: "imagenes/equipo/juan.jpg",
        cedula: "20-70-8224",
        carrera: "Ingenieria de software"
    },
    {
        nombre: "Diego Cedeño",
        rol: "Maestro Heladero",
        descripcion: "...",
        imagen: "imagenes/equipo/diego.jpg",
        cedula: "8-1026-447",
        carrera: "Ingeniería de software"
    },
    {
        nombre: "Alejandro Chan",
        rol: "...",
        descripcion: "...",
        imagen: "imagenes/equipo/alejandro.jpg",
        cedula: "8-1031-302",
        carrera: "Ingenieria de software"
    }
];

// ========================================
// RENDERIZAR EQUIPO
// ========================================
function renderTeam() {
    const grid = document.getElementById('teamGrid');
    if (!grid) return;

    grid.innerHTML = '';

    teamMembers.forEach(member => {
        const card = document.createElement('div');
        card.className = 'team-card';

        card.innerHTML = `
            <div class="team-card-image" style="background-image: url('${member.imagen}'); background-size: cover; background-position: center;"></div>
            <div class="team-card-info">
                <h3>${member.nombre}</h3>
                <p class="role">${member.rol}</p>
                <p class="team-description">${member.descripcion}</p>
                <div class="team-details">
                    <p><strong>Cédula:</strong> ${member.cedula}</p>
                    <p><strong>Carrera:</strong> ${member.carrera}</p>
                </div>
            </div>
        `;

        grid.appendChild(card);
    });
}

// ========================================
// CARGAR AL INICIO
// ========================================
document.addEventListener('DOMContentLoaded', renderTeam);