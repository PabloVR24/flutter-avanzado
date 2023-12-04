const { io } = require("../index");

io.on("connection", (client) => {
  console.log("Cleinte conectado");
  client.on("disconnect", () => {
    console.log("Cleinte desconectado");
  });

  client.on("mensaje", (payload) => {
    console.log("Mensaje", payload);
    io.emit("mensaje", { admin: "Nuevo mensaje" });
  });
});
