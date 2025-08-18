//
//  TaskListScreen.swift
//  Demo
//
//  Created by Andrea Torres on 14/04/25.
//

import SwiftUI

struct TaskList: View {
    
    @State var tasks = [
        Task(title: "Asistir a clases", isCompleted: false)
        , Task(title: "Estudiar", isCompleted: false)
        , Task(title: "Hacer ejercicio", isCompleted: false)
        , Task(title: "Hacer una cena", isCompleted: false)
    ]
    
    @State var showform = false
    
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(tasks.indices, id: \.self) { index in
                    NavigationLink(destination: {
                        TaskDetail(title: tasks[index].title,
                                   addTask: {_ in},
                                   updateTask: { title in
                            tasks[index].title = title})
                    }) {
                        Text(tasks[index].title)
                    }
                   
                }
                    
                .onDelete {IndexSet in
                    if let index = IndexSet.first{
                        tasks.remove(at: index)
                    }
                }
            }
            .navigationTitle(Text("Tasks"))
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showform = true
                                    }) {
                                        Image(systemName: "plus")
                                    }
                                )
            .sheet(isPresented: $showform) {
                TaskDetail(
                    addTask: { title in
                        tasks.append(Task(title: title, isCompleted: false))
                    },
                    updateTask: {_ in}
                    
                    )
                }
            }//NavegationStack
        }//body
    }


#Preview {
    TaskList()
}
