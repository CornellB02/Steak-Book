import React, { createContext, useContext, useRef, useEffect, useState } from 'react';
import ReactDOM from 'react-dom';
import './Modal.css';

export const ModalContext = createContext();

export function ModalProvider({ children }) {
  const modalRef = useRef();
  const [value, setValue] = useState(null);
  
  useEffect(() => {
    setValue(modalRef.current);
  }, []);
  
  return (
    <ModalContext.Provider value={value}>
      {children}
      <div ref={modalRef} />
    </ModalContext.Provider>
  );
}

export function Modal({ onClose, children }) {
  const modalNode = useContext(ModalContext);
  
  if (!modalNode) return null;
  
  return ReactDOM.createPortal(
    <div id="modal">
      <div id="modal-background" onClick={onClose} />
      <div id="modal-content">
        {children}
      </div>
    </div>,
    modalNode
  );
}