
/* =========================
   TASK 1
========================= */
console.log("========== TASK 1 ==========");
console.log("Welcome to the Community Portal");

window.onload = function () {
    alert("Page is fully loaded");
};


/* =========================
   TASK 2 
========================= */
console.log("\n========== TASK 2 ==========");

const eventName = "Community Meetup";
const eventDate = "2026-06-15";
let seatsAvailable = 50;
console.log(`Event: ${eventName} | Date: ${eventDate}`);
console.log("Initial Seats:", seatsAvailable);
seatsAvailable--;
console.log("After booking seat:", seatsAvailable);

/*seatsAvailable++;
console.log("After cancellation/restoration:", seatsAvailable);*/


/* =========================
   TASK 3
========================= */
console.log("\n========== TASK 3 ==========");

const events = [
    { name: "Dance Show", date: "2026-07-10", seats: 20 },
    { name: "Old Workshop", date: "2024-01-01", seats: 10 }
];

const today = new Date();

events.forEach(event => {
    if (new Date(event.date)>today && event.seats > 0) {
        console.log(event.name+" → AVAILABLE");
    } else {
        console.log(event.name+" → NOT AVAILABLE");
    }
});

function register(event) {
    try {
        if (event.seats<=0) {
            throw new Error("No seats available for:"+ event.name);
        }
        event.seats--;
        console.log("Successfully registered for:"+event.name);
    } catch (error) {
        console.log("Registration Error:"+error.message);
    }
}
register(events[0]);
register(events[1]);

/* =========================
   TASK 4 
========================= */
console.log("\n========== TASK 4 ==========");

const eventList = [];
function addEvent(name, category) {
    eventList.push({ name, category });
    console.log("Event Added:", name, category);
}
function registerUser(eventName) {
    console.log("User registered for:", eventName);
}
function filterEventsByCategory(category, callback) {
    const filtered = eventList.filter(e => e.category === category);
    console.log("Filtered Events for category:", category);
    callback(filtered);
}
// Closure
function registrationTracker() {
    let count = 0;
    return function () {
        count++;
        console.log("Total registrations so far:"+count);
        return count;
    };
}

const trackMusic = registrationTracker();

trackMusic();
trackMusic();

addEvent("Rock Concert", "Music");
addEvent("Baking Workshop", "Workshop");

filterEventsByCategory("Music", data => {
    console.log("Callback Result:", data);
});


/* =========================
   TASK 5 
========================= */
console.log("\n========== TASK 5 ==========");

class Event {
    constructor(name, date, seats) {
        this.name = name;
        this.date = date;
        this.seats = seats;
    }
}
Event.prototype.checkAvailability = function () {
    return this.seats > 0 ? "Seats Available" : "House Full";
};
const event1 = new Event("Art Expo", "2026-09-12", 15);
console.log("Event Created:", event1);
console.log("Availability:", event1.checkAvailability());
Object.entries(event1).forEach(([key, value]) => {
    console.log(key+":", value);
});


/* =========================
   TASK 6 
========================= */
console.log("\n========== TASK 6 ==========");

const communityEvents = [
    { name: "Jazz Night", category: "Music" },
    { name: "Coding Bootcamp", category: "Education" },
    { name: "Guitar Workshop", category: "Music" }
];
communityEvents.push({
    name: "Rock Concert",
    category: "Music"
});
console.log("All Events:", communityEvents);
const musicEvents = communityEvents.filter(e => e.category === "Music");
console.log("Music Events List:", musicEvents);
const displayCards = communityEvents.map(e => `Workshop on ${e.name}`);
console.log("Formatted Cards:", displayCards);


/* =========================
   TASK 7 
========================= */
console.log("\n========== TASK 7 ==========");

const container = document.querySelector("#eventContainer");

communityEvents.forEach(event => {
    const card = document.createElement("div");

    card.innerHTML = `
        <h3>${event.name}</h3>
        <p>${event.category}</p>
        <button>Register</button>
    `;

    const button = card.querySelector("button");

    button.onclick = function () {
        button.textContent = "Registered";
    };

    container.appendChild(card);
});


/* =========================
   TASK 8 
========================= */
console.log("\n========== TASK 8 ==========");

document.querySelector("#registerBtn").onclick = function () {
    console.log("Register button clicked");
};

document.querySelector("#categoryFilter").onchange = function () {
    console.log("Selected Category:", this.value);
};

document.querySelector("#searchBox").addEventListener("keydown", function (event) {
    console.log("Key Pressed:", event.key);
});


/* =========================
   TASK 9 
========================= */
console.log("\n========== TASK 9 ==========");

fetch("https://jsonplaceholder.typicode.com/posts")
.then(res => res.json())
.then(data => {
    console.log("Fetched Data (sample):", data.slice(0, 2));
})
.catch(err => console.log("Fetch Error:", err));
async function fetchEvents() {
    console.log("Loading events...");
    const spinner = document.querySelector("#loading");
    spinner.style.display = "block";
    try {
        const res = await fetch("https://jsonplaceholder.typicode.com/posts");
        const data = await res.json();
        console.log("Async Fetch Success (sample):", data.slice(0, 2));
    } catch (err) {
        console.log("Async Error:", err);

    } finally {
        spinner.style.display = "none";
        console.log("Loading finished");
    }
}
fetchEvents();


/* =========================
   TASK 10
========================= */
console.log("\n========== TASK 10 ==========");

const data = [{ name: "Yoga Camp", category: "Health", seats: 25 }];
data.forEach(({ name, category, seats }) => {
    console.log("Destructured Data:", name, category, seats);
});
const clonedData = [...data];
console.log("Cloned Data:", clonedData);
function greetUser(user = "Guest") {
    console.log("Welcome message for:", user);
}
greetUser();
greetUser("Harsh");


/* =========================
   TASK 11
========================= */
console.log("\n========== TASK 11 ==========");

document.querySelector("#registrationForm")
.addEventListener("submit", function (event) {
    event.preventDefault();
    const form = event.target;
    const name = form.elements["name"].value;
    const email = form.elements["email"].value;
    const selectedEvent = form.elements["event"].value;
    document.querySelector("#error").textContent = "";

    if (!name || !email || !selectedEvent) {
        document.querySelector("#error").textContent =
            "Please fill all fields";
        return;
    }
    console.log("Name:", name);
    console.log("Email:", email);
    console.log("Selected Event:", selectedEvent);
});


/* =========================
   TASK 12 
========================= */
console.log("\n========== TASK 12 ==========");

function submitRegistration() {
    document.querySelector("#message").textContent ="Sending registration...";
    setTimeout(() => {
        fetch("https://jsonplaceholder.typicode.com/posts", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                name: "Harsh",
                event: "Music Night"
            })
        })
        .then(response => response.json())

        .then(data => {
            document.querySelector("#message").textContent =
                "Registration Successful";
            console.log(data);
        })
        .catch(error => {
            document.querySelector("#message").textContent ="Registration Failed";
            console.log(error);
        });

    }, 2000);
}

submitRegistration();


/* =========================
   TASK 13
========================= */
console.log("\n========== TASK 13 ==========");
function debugRegistration(data) {
    console.log("Debug Started");
    console.log("Input Data:", data);
    debugger;
    fetch("https://jsonplaceholder.typicode.com/posts", {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
            "Content-Type": "application/json"
        }
    })
    .then(res => res.json())
    .then(result => {
        console.log("Server Response:", result);
    });
}
debugRegistration({
    name: "Harsh",
    email: "harsh@gmail.com"
});


/* =========================
   TASK 14
========================= */
console.log("\n========== TASK 14 ==========");

$("#registerBtn").click(function () {
    $("#eventCard").fadeOut(500).fadeIn(500);

    console.log("Register button clicked");
});

console.log(
    "React and Vue make UI updates easier using reusable components."
);