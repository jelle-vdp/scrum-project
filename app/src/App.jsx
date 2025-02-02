import { GbayProvider } from './context/GbayContext';
import { BrowserRouter as Router, Routes, Route} from 'react-router-dom';

import HomePage from "./pages/HomePage";
import ProductPage from "./pages/ProductPage";
import AboutUsPage from "./pages/AboutUsPage";
import LoginPage from "./pages/LoginPage";
import RegisterPage from "./pages/RegisterPage";

import Navbar from "./components/Navbar";
import Footer from "./components/Footer";

function App() {
  return (
    <GbayProvider>
      <Router>
        <Navbar />
        <main>
          <Routes>
            <Route exact path="/" element={<HomePage />} />
            <Route path="/product/:id" element={<ProductPage />} />
            <Route path="/about-us" element={<AboutUsPage />} />
            <Route path="/login" element={<LoginPage />} />
            <Route path="/register" element={<RegisterPage />} />
          </Routes>
        </main> 
        <Footer />
      </Router>
    </GbayProvider>
  )
}

export default App