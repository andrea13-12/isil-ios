//
//  Task.swift
//  ToDo
//
//  Created by Andrea Torres on 12/05/25.
//

import Foundation

//Creamos una clase
struct Task: Identifiable, Equatable {
    let id: UUID
    let title: String
    let creqatedAt: Date
    let dueDate: Date
}
