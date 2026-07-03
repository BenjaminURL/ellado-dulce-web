document.addEventListener("DOMContentLoaded", function () {
    const eventChoices = document.querySelectorAll(".event-choice");
    const eventRadios = document.querySelectorAll('input[name="tipoEvento"]');
    const birthdayNameBox = document.getElementById("birthdayNameBox");
    const birthdayName = document.getElementById("birthdayName");
    const birthdaySummaryLine = document.getElementById("birthdaySummaryLine");
    const summaryBirthdayName = document.getElementById("summaryBirthdayName");

    const eventDate = document.getElementById("eventDate");
    const startTime = document.getElementById("startTime");
    const eventHours = document.getElementById("eventHours");
    const calendarTitle = document.getElementById("calendarTitle");
    const calendarDays = document.getElementById("calendarDays");
    const prevMonth = document.getElementById("prevMonth");
    const nextMonth = document.getElementById("nextMonth");

    const decoracionRadios = document.querySelectorAll('input[name="decoracion"]');
    const decoracionBox = document.getElementById("decoracionBox");
    const decoracionTexto = document.getElementById("decoracionTexto");

    const pastelRadios = document.querySelectorAll('input[name="pastel"]');
    const pastelBox = document.getElementById("pastelBox");
    const pastelCards = document.querySelectorAll(".pastel-card");

    const boquitasRadios = document.querySelectorAll('input[name="boquitas"]');
    const boquitasBox = document.getElementById("boquitasBox");
    const boquitaCards = document.querySelectorAll(".boquita-card");

    const actividadesRadios = document.querySelectorAll('input[name="actividades"]');
    const actividadesBox = document.getElementById("actividadesBox");
    const activityChecks = document.querySelectorAll(".activity-check");
    const activitiesSection = document.getElementById("activitiesSection");

    const observaciones = document.getElementById("observaciones");

    const summaryType = document.getElementById("summaryType");
    const summaryHours = document.getElementById("summaryHours");
    const summaryDate = document.getElementById("summaryDate");
    const summaryTime = document.getElementById("summaryTime");
    const summaryBase = document.getElementById("summaryBase");
    const summaryTotal = document.getElementById("summaryTotal");

    const extraHourLine = document.getElementById("extraHourLine");
    const summaryExtraHours = document.getElementById("summaryExtraHours");

    const decoracionLine = document.getElementById("decoracionLine");

    const pastelLine = document.getElementById("pastelLine");
    const summaryPastelName = document.getElementById("summaryPastelName");
    const summaryPastel = document.getElementById("summaryPastel");

    const boquitasLine = document.getElementById("boquitasLine");
    const summaryBoquitasName = document.getElementById("summaryBoquitasName");
    const summaryBoquitas = document.getElementById("summaryBoquitas");

    const activitiesLine = document.getElementById("activitiesLine");
    const summaryActivities = document.getElementById("summaryActivities");

    const whatsappReserva = document.getElementById("whatsappReserva");
    const confirmBtn = document.querySelector(".confirm-btn");

    let selectedEvent = "Cumpleaños Dulce";
    let basePrice = 75;

    let selectedPastel = null;
    let selectedBoquita = null;

    function money(value) {
        return "$" + value.toFixed(2);
    }

    function getRadioValue(name) {
        const checked = document.querySelector(`input[name="${name}"]:checked`);
        return checked ? checked.value : null;
    }

    function formatDate(value) {
        if (!value) {
            return "Por definir";
        }

        const parts = value.split("-");
        return `${parts[2]}/${parts[1]}/${parts[0]}`;
    }

    function getExtraHoursPrice() {
        const hours = parseInt(eventHours.value);
        if (hours <= 2) {
            return 0;
        }

        return (hours - 2) * 20;
    }

    function getDecoracionPrice() {
        return getRadioValue("decoracion") === "si" ? 15 : 0;
    }

    function getPastelPrice() {
        return selectedPastel ? selectedPastel.price : 0;
    }

    function getBoquitaPrice() {
        return selectedBoquita ? selectedBoquita.price : 0;
    }

    function getActivitiesPrice() {
        let total = 0;

        activityChecks.forEach(function (activity) {
            if (activity.checked) {
                total += parseFloat(activity.dataset.price);
            }
        });

        return total;
    }

    function getSelectedActivitiesNames() {
        const names = [];

        activityChecks.forEach(function (activity) {
            if (activity.checked) {
                names.push(activity.value);
            }
        });

        return names;
    }

    function calculateTotal() {
        return basePrice +
            getExtraHoursPrice() +
            getDecoracionPrice() +
            getPastelPrice() +
            getBoquitaPrice() +
            getActivitiesPrice();
    }

    const monthNames = [
    "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
    "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
];

const weekDays = ["Lu", "Ma", "Mi", "Ju", "Vi", "Sá", "Do"];

let calendarDate = new Date();
let selectedCalendarDate = null;

/* Aquí puedes poner fechas ocupadas más adelante */
const occupiedDates = [
    // "2026-07-10",
    // "2026-07-15"
];

function formatDateForInput(year, month, day) {
    const monthText = String(month + 1).padStart(2, "0");
    const dayText = String(day).padStart(2, "0");

    return `${year}-${monthText}-${dayText}`;
}

function renderCalendar() {
    calendarDays.innerHTML = "";

    const year = calendarDate.getFullYear();
    const month = calendarDate.getMonth();

    calendarTitle.textContent = `${monthNames[month]} ${year}`;

    weekDays.forEach(function (dayName) {
        const dayLabel = document.createElement("span");
        dayLabel.textContent = dayName;
        calendarDays.appendChild(dayLabel);
    });

    const firstDay = new Date(year, month, 1);
    const totalDays = new Date(year, month + 1, 0).getDate();

    let startDay = firstDay.getDay();

    /*
        JavaScript usa:
        Domingo = 0
        Lunes = 1
        Martes = 2

        Nosotros queremos que el calendario empiece en lunes.
    */
    startDay = startDay === 0 ? 6 : startDay - 1;

    for (let i = 0; i < startDay; i++) {
        const emptyButton = document.createElement("button");
        emptyButton.type = "button";
        emptyButton.classList.add("empty-day");
        emptyButton.textContent = "-";
        calendarDays.appendChild(emptyButton);
    }

    for (let day = 1; day <= totalDays; day++) {
        const button = document.createElement("button");
        const dateValue = formatDateForInput(year, month, day);

        button.type = "button";
        button.textContent = day;
        button.dataset.date = dateValue;

        if (occupiedDates.includes(dateValue)) {
            button.classList.add("disabled-day");
            button.disabled = true;
        }

        if (selectedCalendarDate === dateValue) {
            button.classList.add("selected-day");
        }

        button.addEventListener("click", function () {
            selectedCalendarDate = dateValue;
            eventDate.value = dateValue;

            renderCalendar();
            updateSummary();
        });

        calendarDays.appendChild(button);
    }
}

function updateActivitiesVisibility() {
    if (selectedEvent === "Evento Corporativo") {
        activitiesSection.classList.add("hidden");
        actividadesBox.classList.add("hidden");
        birthdayNameBox.classList.add("hidden");
        birthdaySummaryLine.classList.add("hidden");

        birthdayName.value = "";

        const noActivityRadio = document.querySelector('input[name="actividades"][value="no"]');

        if (noActivityRadio) {
            noActivityRadio.checked = true;
        }

        activityChecks.forEach(function (activity) {
            activity.checked = false;
        });
    } else {
        activitiesSection.classList.remove("hidden");
        birthdayNameBox.classList.remove("hidden");
        birthdaySummaryLine.classList.remove("hidden");
    }
}    

    function updateSummary() {
    updateActivitiesVisibility();

    const hours = parseInt(eventHours.value);
        const extraHoursPrice = getExtraHoursPrice();
        const decoracionPrice = getDecoracionPrice();
        const pastelPrice = getPastelPrice();
        const boquitaPrice = getBoquitaPrice();
        const activitiesPrice = getActivitiesPrice();
        const total = calculateTotal();

        summaryType.textContent = selectedEvent;
        summaryBirthdayName.textContent = birthdayName.value.trim() || "Por definir";
        summaryHours.textContent = hours + " horas";
        summaryDate.textContent = formatDate(eventDate.value);
        summaryTime.textContent = startTime.value || "Por definir";
        summaryBase.textContent = money(basePrice);
        summaryTotal.textContent = money(total);

        if (extraHoursPrice > 0) {
            extraHourLine.classList.remove("hidden");
            summaryExtraHours.textContent = money(extraHoursPrice);
        } else {
            extraHourLine.classList.add("hidden");
        }

        if (decoracionPrice > 0) {
            decoracionLine.classList.remove("hidden");
        } else {
            decoracionLine.classList.add("hidden");
        }

        if (pastelPrice > 0 && selectedPastel) {
            pastelLine.classList.remove("hidden");
            summaryPastelName.textContent = selectedPastel.name;
            summaryPastel.textContent = money(selectedPastel.price);
        } else {
            pastelLine.classList.add("hidden");
        }

        if (boquitaPrice > 0 && selectedBoquita) {
            boquitasLine.classList.remove("hidden");
            summaryBoquitasName.textContent = selectedBoquita.name;
            summaryBoquitas.textContent = money(selectedBoquita.price);
        } else {
            boquitasLine.classList.add("hidden");
        }

        if (activitiesPrice > 0) {
            activitiesLine.classList.remove("hidden");
            summaryActivities.textContent = money(activitiesPrice);
        } else {
            activitiesLine.classList.add("hidden");
        }

        updateWhatsapp();
    }

    function updateWhatsapp() {
        const total = calculateTotal();
        const actividades = getSelectedActivitiesNames();
        const decoracion = getRadioValue("decoracion") === "si" ? decoracionTexto.value.trim() : "No";
        const pastel = selectedPastel ? selectedPastel.name : "No";
        const boquitas = selectedBoquita ? selectedBoquita.name : "No";
        const actividadesTexto = actividades.length > 0 ? actividades.join(", ") : "No";
        const obs = observaciones.value.trim();

        let message =
    "Hola, quiero reservar un evento en Ellado Dulce.%0A" +
    "Tipo de evento: " + encodeURIComponent(selectedEvent) + "%0A";

if (selectedEvent === "Cumpleaños Dulce") {
    message += "Nombre del cumpleañero: " + encodeURIComponent(birthdayName.value.trim() || "Por definir") + "%0A";
}

message +=
    "Fecha: " + encodeURIComponent(formatDate(eventDate.value)) + "%0A" +
    "Hora: " + encodeURIComponent(startTime.value || "Por definir") + "%0A" +
    "Duración: " + encodeURIComponent(eventHours.value + " horas") + "%0A" +
    "Decoración especial: " + encodeURIComponent(decoracion || "Sí, pendiente de detallar") + "%0A" +
    "Pastel: " + encodeURIComponent(pastel) + "%0A" +
    "Boquitas: " + encodeURIComponent(boquitas) + "%0A";

if (selectedEvent === "Cumpleaños Dulce") {
    message += "Actividades: " + encodeURIComponent(actividadesTexto) + "%0A";
}

message += "Total estimado: " + encodeURIComponent(money(total));

        if (obs !== "") {
            message += "%0AObservaciones: " + encodeURIComponent(obs);
        }

        whatsappReserva.href = "https://wa.me/5071234567?text=" + message;
    }

    eventChoices.forEach(function (choice) {
        choice.addEventListener("click", function () {
            eventChoices.forEach(function (item) {
                item.classList.remove("selected");
            });

            choice.classList.add("selected");

            const input = choice.querySelector("input");
            input.checked = true;

            selectedEvent = choice.dataset.type;
            basePrice = parseFloat(choice.dataset.price);

            updateSummary();
        });
    });

    eventRadios.forEach(function (radio) {
        radio.addEventListener("change", updateSummary);
    });

    birthdayName.addEventListener("input", function () {
    updateSummary();
});
    
    eventDate.addEventListener("input", function () {
    if (eventDate.value) {
        selectedCalendarDate = eventDate.value;

        const selectedDate = new Date(eventDate.value + "T00:00:00");
        calendarDate = new Date(selectedDate.getFullYear(), selectedDate.getMonth(), 1);

        renderCalendar();
    }

    updateSummary();
});

startTime.addEventListener("input", updateSummary);
eventHours.addEventListener("change", updateSummary);

prevMonth.addEventListener("click", function () {
    calendarDate.setMonth(calendarDate.getMonth() - 1);
    renderCalendar();
});

nextMonth.addEventListener("click", function () {
    calendarDate.setMonth(calendarDate.getMonth() + 1);
    renderCalendar();
});

    decoracionRadios.forEach(function (radio) {
        radio.addEventListener("change", function () {
            if (getRadioValue("decoracion") === "si") {
                decoracionBox.classList.remove("hidden");
            } else {
                decoracionBox.classList.add("hidden");
                decoracionTexto.value = "";
            }

            updateSummary();
        });
    });

    decoracionTexto.addEventListener("input", updateWhatsapp);

    pastelRadios.forEach(function (radio) {
        radio.addEventListener("change", function () {
            if (getRadioValue("pastel") === "si") {
                pastelBox.classList.remove("hidden");
            } else {
                pastelBox.classList.add("hidden");
                selectedPastel = null;

                pastelCards.forEach(function (card) {
                    card.classList.remove("selected");
                });
            }

            updateSummary();
        });
    });

    pastelCards.forEach(function (card) {
        card.addEventListener("click", function () {
            pastelCards.forEach(function (item) {
                item.classList.remove("selected");
            });

            card.classList.add("selected");

            selectedPastel = {
                name: card.dataset.name,
                price: parseFloat(card.dataset.price)
            };

            updateSummary();
        });
    });

    boquitasRadios.forEach(function (radio) {
        radio.addEventListener("change", function () {
            if (getRadioValue("boquitas") === "si") {
                boquitasBox.classList.remove("hidden");
            } else {
                boquitasBox.classList.add("hidden");
                selectedBoquita = null;

                boquitaCards.forEach(function (card) {
                    card.classList.remove("selected");
                });
            }

            updateSummary();
        });
    });

    boquitaCards.forEach(function (card) {
        card.addEventListener("click", function () {
            boquitaCards.forEach(function (item) {
                item.classList.remove("selected");
            });

            card.classList.add("selected");

            selectedBoquita = {
                name: card.dataset.name,
                price: parseFloat(card.dataset.price)
            };

            updateSummary();
        });
    });

    actividadesRadios.forEach(function (radio) {
        radio.addEventListener("change", function () {
            if (getRadioValue("actividades") === "si") {
                actividadesBox.classList.remove("hidden");
            } else {
                actividadesBox.classList.add("hidden");

                activityChecks.forEach(function (activity) {
                    activity.checked = false;
                });
            }

            updateSummary();
        });
    });

    activityChecks.forEach(function (activity) {
        activity.addEventListener("change", updateSummary);
    });

    observaciones.addEventListener("input", updateWhatsapp);

    confirmBtn.addEventListener("click", function () {
        alert("Reserva agregada. Para confirmar, comunícate por WhatsApp.");
    });

    renderCalendar();
    updateSummary();
});