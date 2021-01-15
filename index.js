const express = require('express');
const morgan = require('morgan');
const app = express();

const actores = require('./routes/actores');

require('dotenv').config()

app.use(morgan('dev'));

app.use(express.json());



// ROUTES

// Actores
app.use('/api', actores);

// FIN ROUTES



app.get('/', (req, res) => {
    res.send('<h1>Hola Emanuel Acevedo</h1>');
});

app.get('/estudiantes', (req, res) => {
    let estudiantes = [];
    estudiantes.push({nombre: 'Emanue',apellido: 'Acevedo',edad: 20});
    res.json(estudiantes);
    res.send('<h1>Hola Emanuel Acevedo</h1>');
});


app.set('port', process.env.PORT || 5030);
app.listen(app.get('port'), () => {
    console.log(`Server on port:`,app.get('port'));
});