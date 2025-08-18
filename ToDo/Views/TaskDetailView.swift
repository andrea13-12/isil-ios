//
//  TaskDetailView.swift
//  ToDo
//
//  Created by Andrea Torres on 5/05/25.
//

import SwiftUI

struct TaskDetailView: View {
    @StateObject var viewModel = TaskDetailViewModel()
    @Environment(\.dismiss) var dismiss 
    @State var editingTask: Task? = nil
    
    
    var title: String {
        editingTask != nil ? "Update Task" : "New Task"
    }
    
    var onSave: (Task) -> Void = { _ in}

    
    var body: some View {
        
        NavigationStack {
            Form {
                Section{
                    TextField("Title", text:$viewModel.title)
                        .textInputAutocapitalization(.never)
                    DatePicker("Due Date",
                               selection: $viewModel.dueDate,
                               in: Date()...,
                               displayedComponents: [.date])
                }
                //in: date()..., solo deja colocar fechas futuras
                //Displayedcomponents: [.date] hace que solo se vea la fecha
                Section {
                    Button(action: {
                        if let task = viewModel.validate(id: editingTask?.id) {
                            onSave(task)
                            dismiss()
                        }
                    }) {
                        Text("Save")
                    }
                    if let error = viewModel.errorMessage {
                        Text(error).foregroundStyle(.red)
                    }
                    
                }//Section
            }//Form
            .navigationTitle("New Task")
            .onAppear {
                if let task = editingTask {
                    viewModel.title = task.title
                    viewModel.dueDate = task.dueDate
                }
            }
        } //NavigationStack
    }//body

} //Struct

#Preview {
    TaskDetailView()
}
