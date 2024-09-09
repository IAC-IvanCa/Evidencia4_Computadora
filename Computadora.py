class Computadora:
    def __init__(self, procesador, ram, almacenamiento, sistema_operativo):
        self.procesador = procesador
        self.ram = ram  # en GB
        self.almacenamiento = almacenamiento  # en GB
        self.sistema_operativo = sistema_operativo
        self.encendida = False
        self.programas_instalados = []
        self.espacio_disponible = almacenamiento

    def encender(self):
        if not self.encendida:
            self.encendida = True
            print("La computadora está encendida.")
        else:
            print("La computadora ya está encendida.")

    def apagar(self):
        if self.encendida:
            self.encendida = False
            print("La computadora está apagada.")
        else:
            print("La computadora ya está apagada.")

    def mostrar_especificaciones(self):
        print(f"Procesador: {self.procesador}")
        print(f"RAM: {self.ram} GB")
        print(f"Almacenamiento: {self.almacenamiento} GB")
        print(f"Sistema Operativo: {self.sistema_operativo}")

    # 1. Actualizar sistema operativo
    def actualizar_sistema_operativo(self, nueva_version):
        if not self.encendida:
            print("La computadora debe estar encendida para actualizar el sistema operativo.")
            return

        if nueva_version == self.sistema_operativo:
            print(f"Ya tienes la última versión: {nueva_version}.")
        else:
            print(f"Actualizando el sistema operativo de {self.sistema_operativo} a {nueva_version}...")
            self.sistema_operativo = nueva_version
            print("Actualización completada.")

    # 2. Instalar programa
    def instalar_programa(self, nombre_programa, tamaño_programa):
        if tamaño_programa > self.espacio_disponible:
            print(f"No hay suficiente espacio para instalar {nombre_programa}.")
        else:
            self.programas_instalados.append(nombre_programa)
            self.espacio_disponible -= tamaño_programa
            print(f"{nombre_programa} instalado correctamente. Espacio restante: {self.espacio_disponible} GB.")

    # 3. Optimizar rendimiento
    def optimizar_rendimiento(self):
        if not self.encendida:
            print("La computadora debe estar encendida para optimizar el rendimiento.")
            return

        # Simula liberar 10% de la RAM en uso (por simplicidad)
        ram_liberada = self.ram * 0.10
        self.ram += ram_liberada
        print(f"Rendimiento optimizado. Se han liberado {ram_liberada} GB de RAM.")
        print(f"RAM actual disponible: {self.ram} GB.")

    # Método __str__ para representar el objeto como cadena
    def __str__(self):
        estado = "encendida" if self.encendida else "apagada"
        programas = ", ".join(self.programas_instalados) if self.programas_instalados else "Ninguno"
        return (f"Computadora:\n"
                f"- Procesador: {self.procesador}\n"
                f"- RAM: {self.ram} GB\n"
                f"- Almacenamiento: {self.almacenamiento} GB\n"
                f"- Sistema Operativo: {self.sistema_operativo}\n"
                f"- Estado: {estado}\n"
                f"- Programas instalados: {programas}\n"
                f"- Espacio disponible: {self.espacio_disponible} GB")