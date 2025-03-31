import React from 'react';
import { createRoot } from 'react-dom/client';

const App = () => {
  return <div>Hello from React integrated with Hugo!</div>;
};

const domNode = document.getElementById('react-root');
const root = createRoot(domNode);
root.render(<App />);
