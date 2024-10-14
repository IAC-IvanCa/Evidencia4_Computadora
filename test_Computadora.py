import unittest

from ComputadoraR import Computadora

class TestComputadora(unittest.TestCase):
    def setUp(self):
        self.computadora = Computadora("Intel i5", 8, 256, "Windows 10")

    def test_encender_apagar(self):
        self.computadora.encender()
        self.assertTrue(self.computadora.encendida)
        self.computadora.apagar()
        self.assertFalse(self.computadora.encendida)

    def test_mostrar_especificaciones(self):
        self.assertEqual(self.computadora.obtener_procesador(), "Intel i5")

    def test_actualizar_sistema_operativo(self):
        self.computadora.encender()
        self.computadora.actualizar_sistema_operativo("Windows 11")
        self.assertEqual(self.computadora.sistema_operativo, "Windows 11")

    def test_instalar_programa_exito(self):
        self.computadora.encender()
        self.computadora.instalar_programa("Chrome", 100)
        self.assertIn("Chrome", self.computadora.programas_instalados)

    def test_instalar_programa_fallo(self):
        self.computadora.encender()
        with self.assertRaises(RuntimeError):
            self.computadora.instalar_programa("Photoshop", 500)

    def test_optimizar_rendimiento(self):
        self.computadora.encender()
        ram_inicial = self.computadora.ram
        self.computadora.optimizar_rendimiento()
        self.assertGreater(self.computadora.ram, ram_inicial)

    def test_espacio_disponible(self):
        self.computadora.encender()
        espacio_inicial = self.computadora.espacio_disponible
        self.computadora.instalar_programa("VLC", 50)
        self.assertEqual(self.computadora.espacio_disponible, espacio_inicial - 50)

    def test_no_actualizar_a_version_anterior(self):
        self.computadora.encender()
        self.computadora.actualizar_sistema_operativo("Windows 11")
        with self.assertRaises(ValueError):  
            self.computadora.actualizar_sistema_operativo("Windows 10")

