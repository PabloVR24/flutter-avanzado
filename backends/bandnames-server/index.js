const express = require("express");
const path = require("path");
require("dotenv").config();


const app = express();

//! NODE SERVER
const server = require('http').createServer(app);
const io = require('socket.io')(server);

// ! Sockets Messages

io.on('connection', client => {
    console.log('Cleinte conectado');
    client.on('disconnect', () => {
        console.log('Cleinte desconectado');
     });

     client.on('mensaje', (payload)=>{
        console.log('Mensaje', payload);
        io.emit('mensaje', {admin:'Nuevo mensaje'})
     })
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
