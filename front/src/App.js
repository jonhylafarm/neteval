import React, {useState, useEffect} from 'react';
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import axios from 'axios';
import { Modal, ModalBody, ModalFooter, ModalHeader } from 'reactstrap';

function App() {
  const urlApi = 'https://localhost:5001/api/';
  const [info, setInfo] =  useState([]);
  const [materias, setMaterias] =  useState([]);

  const obtenerDatos = async()=>{
    var url = urlApi+'Alumnos';
    await axios.get(url)
    .then(response => {
      setInfo(response.data);
    }).catch(error => {
      console.log(error);
    })
  }
  const obtenerMat = async()=>{
    var url = urlApi+'Materias';
    await axios.get(url)
    .then(response => {
      setMaterias(response.data);
    }).catch(error => {
      console.log(error);
    })
  }
  useEffect(()=>{
    obtenerDatos();
  },[]);
  return (
    <div className="App">
      <table className='table table-bordered'>
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Cédula</th>
            <th>Aula</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {
            info.map(datos => (
              <tr key={datos.id}>
                {console.log(datos.id)}
                <td>{datos.id}</td>
                <td>{datos.nombre}</td>
                <td>{datos.apellido}</td>
                <td>{datos.cedula}</td>
                <td>{datos.aula_id}</td>
                <td><button className="btn btn-primary">Calificar</button></td>
              </tr>
            ))
          }
        </tbody>
      </table>
      <Modal>
        <ModalHeader>Calificaciones</ModalHeader>
          <ModalBody>
            <div className='form-group'>
              <input className='form-control' type="text" placeholder='Calificación'/>
            </div>
          </ModalBody>
          <ModalFooter>
            <button className="btn btn-primary">Insertar</button>
          </ModalFooter>
      </Modal>
    </div>
  );
}

export default App;
