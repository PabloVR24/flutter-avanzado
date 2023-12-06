const express = require("express");
const Bands = require("./models/bands");
const path = require("path");
const Band = require("./models/band");

const bands = new Bands();
bands.addBand(new Band("Post Malone"));
bands.addBand(new Band("Bad Bunny"));
bands.addBand(new Band("Hardwell"));
bands.addBand(new Band("Peso Pluma"));

console.log(bands);

require("dotenv").config();

const app = express();

//! NODE SERVER
const server = require("http").createServer(app);
const io = require("socket.io")(server);

// ! Sockets Messages

io.on("connection", (client) => {
  console.log("Cliente conectado");

  client.emit("active-bands", bands.getBands());

  client.on("disconnect", () => {
    console.log("Cliente desconectado");
  });

  client.on("mensaje", (payload) => {
    console.log("Mensaje", payload);
    io.emit("mensaje", { admin: "Nuevo mensaje" });
  });

  client.on("emitir-mensaje", (payload) => {
    client.broadcast.emit("nuevo-mensaje", payload);
  });

  client.on("vote-band", (payload) => {
    bands.voteBand(payload.id);
    io.emit("active-bands", bands.getBands());
  });

  client.on("add-band", (payload) => {
    band = new Band(payload.name)
    bands.addBand(band);
     io.emit("active-bands", bands.getBands());
  });

  client.on("delete-band", (payload) => {
    bands.deleteBand(payload.id);
     io.emit("active-bands", bands.getBands());
  });


});

//! PUBLIC PATH
server.listen(process.env.PORT, (err) => {
  if (err) {
    throw new Error(err);
  }
  console.log(`Servidor corriendo en el puerto: `, process.env.PORT);
});

const publicPath = path.resolve(__dirname, "public");
app.use(express.static(publicPath));
