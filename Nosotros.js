// ========================================
// DATOS DEL EQUIPO - 5 MIEMBROS
// ========================================
const teamMembers = [
    {
        nombre: "Ashely Hernandez",
        rol: "Fundadora & Pastelera",
        descripcion: "Con 15 años de experiencia, Ashely es el alma creativa detrás de cada pastel. Su pasión por la repostería comenzó en la cocina de su abuela.",
        imagen: "imagenes/equipo/ashely.jpg",
        cedula: "8-1021-1342",
        carrera: "Ingenieria de software"
    },
    {
        nombre: "Benjamin Romero",
        rol: "Chef Ejecutivo",
        descripcion: "benjamin combina técnicas tradicionales con un toque moderno. Especialista en helados artesanales y postres de autor.",
        imagen: "imagenes/equipo/benjamin.jpg",
        cedula: "8-1025-1530",
        carrera: "Ingenieria de software"
    },
    {
        nombre: "Juan Bermudez",
        rol: "Diseñador de Pasteles",
        descripcion: "Juan convierte cada pastel en una obra de arte. Su ojo para el diseño y los detalles hace que cada creación sea única.",
        imagen: "imagenes/equipo/juan.jpg",
        cedula: "20-70-8224",
        carrera: "Ingenieria de software"
    },
    {
        nombre: "Diego Cedeño",
        rol: "Maestro Heladero",
        descripcion: "Diego es el responsable de nuestros helados cremosos y llenos de sabor. Siempre está experimentando con nuevas combinaciones.",
        imagen: "imagenes/equipo/diego.jpg",
        cedula: "8-1026-447",
        carrera: "Ingeniería de software"
    },
    {
        nombre: "Alejandro Chan",
        rol: "Gerente de Operaciones",
        descripcion: "Alejandro asegura que todo funcione a la perfección. Su liderazgo y organización mantienen el equipo unido y los pedidos en tiempo récord.",
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