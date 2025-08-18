//
//  TaskDetailViewModel.swift
//  ToDo
//
//  Created by Andrea Torres on 5/05/25.
//

import Foundation

class TaskDetailViewModel:ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var errorMessage: String?
        
    func validate(id: UUID?) -> Task? {
        guard !title .isEmpty else {
            errorMessage = "Title is required"
            return nil
        }
    
        errorMessage = nil
        return Task(id: id ?? UUID(), title: title, creqatedAt: Date(), dueDate: dueDate)
    }
}
