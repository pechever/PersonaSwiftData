//
//  PersonaSwiftDataApp.swift
//  PersonaSwiftData
//
//  Created by Fabricio Echeverría on 9/9/25.
//

import SwiftUI
import SwiftData

@main
struct PersonaSwiftDataApp: App {
    var body: some Scene {
            WindowGroup {
                ContentView()
            }
            .modelContainer(for: Persona.self) // Aquí indicamos nuestro modelo
        }
}
