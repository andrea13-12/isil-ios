//
//  Task.swift
//  Demo
//
//  Created by Andrea Torres on 14/04/25.
//

import Foundation

struct Task: Identifiable { 
    let id = UUID() //|Para que automaticamente se cree un id| UUID Permite declarar identificadores unicos
    var title: String
    let isCompleted: Bool
}
