import express from "express";
const app = express();

app.listen(3000, (err) => {
  if (err) {
    throw new Error(err);
  }
  console.log(`Servidor corriendo en el puerto: `, 3000);
});
