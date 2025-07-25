import React, { useEffect, useState } from 'react';
import { Table, Button, Modal, Form } from 'react-bootstrap';
import { politicaService } from '../../services/api';

const PoliticaPrivacidad = () => {
  const [data, setData] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [modalData, setModalData] = useState(null);
  const [editMode, setEditMode] = useState(false);
  const [form, setForm] = useState({ titulo: '', descripcion: '', activo: true, version: '' });
  const [showCreate, setShowCreate] = useState(false);
  const [createForm, setCreateForm] = useState({ titulo: '', descripcion: '', activo: true, version: '' });

  const fetchData = async () => {
    const res = await politicaService.getAll();
    setData(res.data);
  };

  useEffect(() => {
    fetchData();
  }, []);

  const handleShow = (row) => {
    setModalData(row);
    setEditMode(false);
    setShowModal(true);
  };

  const handleEdit = (row) => {
    setModalData(row);
    setForm({
      titulo: row.titulo,
      descripcion: row.descripcion,
      activo: row.activo !== undefined ? row.activo : true,
      version: row.version || ''
    });
    setEditMode(true);
    setShowModal(true);
  };

  const handleDelete = async (id) => {
    if (window.confirm('¿Seguro que deseas eliminar este registro?')) {
      await politicaService.delete(id);
      fetchData();
    }
  };

  const handleUpdate = async (e) => {
    e.preventDefault();
    await politicaService.update(modalData.id, form);
    setShowModal(false);
    fetchData();
  };

  const handleCreate = async (e) => {
    e.preventDefault();
    await politicaService.create(createForm);
    setShowCreate(false);
    setCreateForm({ titulo: '', descripcion: '', activo: true, version: '' });
    fetchData();
  };

  return (
    <div>
      <h2 className="mb-4">Administración Política de Privacidad</h2>
      <Button className="mb-3" variant="success" onClick={() => setShowCreate(true)}>
        + Nuevo Registro
      </Button>
      <Table striped bordered hover responsive>
        <thead>
          <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Descripción</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {data.map(row => (
            <tr key={row.id}>
              <td>{row.id}</td>
              <td>{row.titulo}</td>
              <td>{row.descripcion}</td>
              <td>
                <Button size="sm" variant="info" className="me-2" onClick={() => handleShow(row)}>Ver</Button>
                <Button size="sm" variant="warning" className="me-2" onClick={() => handleEdit(row)}>Actualizar</Button>
                <Button size="sm" variant="danger" onClick={() => handleDelete(row.id)}>Eliminar</Button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>

      {/* Modal Ver/Actualizar */}
      <Modal show={showModal} onHide={() => setShowModal(false)}>
        <Modal.Header closeButton>
          <Modal.Title>{editMode ? 'Actualizar' : 'Detalle'}</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          {modalData && !editMode && (
            <div>
              <p><strong>ID:</strong> {modalData.id}</p>
              <p><strong>Título:</strong> {modalData.titulo}</p>
              <p><strong>Descripción:</strong> {modalData.descripcion}</p>
              <p><strong>Versión:</strong> {modalData.version}</p>
              <p><strong>Activo:</strong> {modalData.activo ? 'Sí' : 'No'}</p>
              <p><strong>Fecha creación:</strong> {modalData.fecha_creacion}</p>
              <p><strong>Fecha actualización:</strong> {modalData.fecha_actualizacion}</p>
            </div>
          )}
          {modalData && editMode && (
            <Form onSubmit={handleUpdate}>
              <Form.Group className="mb-3">
                <Form.Label>Título</Form.Label>
                <Form.Control
                  type="text"
                  value={form.titulo}
                  onChange={e => setForm({ ...form, titulo: e.target.value })}
                  required
                />
              </Form.Group>
              <Form.Group className="mb-3">
                <Form.Label>Descripción</Form.Label>
                <Form.Control
                  as="textarea"
                  rows={3}
                  value={form.descripcion}
                  onChange={e => setForm({ ...form, descripcion: e.target.value })}
                  required
                />
              </Form.Group>
              <Form.Group className="mb-3">
                <Form.Label>Versión</Form.Label>
                <Form.Control
                  type="text"
                  value={form.version}
                  onChange={e => setForm({ ...form, version: e.target.value })}
                />
              </Form.Group>
              <Form.Group className="mb-3">
                <Form.Label>Activo</Form.Label>
                <Form.Check
                  type="checkbox"
                  label="¿Activo?"
                  checked={form.activo}
                  onChange={e => setForm({ ...form, activo: e.target.checked })}
                />
              </Form.Group>
              <Button type="submit" variant="primary">Guardar Cambios</Button>
            </Form>
          )}
        </Modal.Body>
      </Modal>

      {/* Modal Crear */}
      <Modal show={showCreate} onHide={() => setShowCreate(false)}>
        <Modal.Header closeButton>
          <Modal.Title>Nuevo Registro</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form onSubmit={handleCreate}>
            <Form.Group className="mb-3">
              <Form.Label>Título</Form.Label>
              <Form.Control
                type="text"
                value={createForm.titulo}
                onChange={e => setCreateForm({ ...createForm, titulo: e.target.value })}
                required
              />
            </Form.Group>
            <Form.Group className="mb-3">
              <Form.Label>Descripción</Form.Label>
              <Form.Control
                as="textarea"
                rows={3}
                value={createForm.descripcion}
                onChange={e => setCreateForm({ ...createForm, descripcion: e.target.value })}
                required
              />
            </Form.Group>
            <Form.Group className="mb-3">
              <Form.Label>Versión</Form.Label>
              <Form.Control
                type="text"
                value={createForm.version}
                onChange={e => setCreateForm({ ...createForm, version: e.target.value })}
              />
            </Form.Group>
            <Form.Group className="mb-3">
              <Form.Label>Activo</Form.Label>
              <Form.Check
                type="checkbox"
                label="¿Activo?"
                checked={createForm.activo}
                onChange={e => setCreateForm({ ...createForm, activo: e.target.checked })}
              />
            </Form.Group>
            <Button type="submit" variant="success">Crear</Button>
          </Form>
        </Modal.Body>
      </Modal>
    </div>
  );
};

export default PoliticaPrivacidad;
