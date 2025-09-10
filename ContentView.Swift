import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var personas: [Persona]
    
    @State private var nombre = ""
    @State private var edad = ""

    var body: some View {
        NavigationView {
            VStack {
                // Formulario para nueva persona
                HStack {
                    TextField("Nombre", text: $nombre)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Edad", text: $edad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    Button("Agregar") {
                        if let edadInt = Int(edad) {
                            let nuevaPersona = Persona(nombre: nombre, edad: edadInt)
                            context.insert(nuevaPersona)
                            try? context.save()
                            nombre = ""
                            edad = ""
                        }
                    }
                }.padding()

                // Lista de personas
                List {
                    ForEach(personas) { persona in
                        VStack(alignment: .leading) {
                            Text(persona.nombre).font(.headline)
                            Text("Edad: \(persona.edad)")
                        }
                    }
                    .onDelete(perform: eliminarPersona)
                }
            }
            .navigationTitle("Personas")
        }
    }
    
    private func eliminarPersona(at offsets: IndexSet) {
        for index in offsets {
            let persona = personas[index]
            context.delete(persona)
        }
        try? context.save()
    }
}
