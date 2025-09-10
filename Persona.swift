//
//  Persona.swift
//  PersonaSwiftData
//
//  Created by Fabricio Echeverría on 9/9/25.
//


import Foundation
import SwiftData

@Model
class Persona {
    var nombre: String
    var edad: Int

    init(nombre: String, edad: Int) {
        self.nombre = nombre
        self.edad = edad
    }
}
