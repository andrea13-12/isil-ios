//
//  TaskListView.swift
//  ToDo
//
//  Created by Andrea Torres on 28/04/25.
//

import SwiftUI

struct TaskListView: View {
    @StateObject var viewModel =
    TaskListViewModel()
    //@State var showDetail = false
    @State var selectedTask: Task? = nil
    @State var showDetail: Bool = false
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.tasks){ task in
                    Text(task.title ?? "")
                        .onTapGesture {
                            selectedTask = task
                        }
                }
                .onDelete{ IndexSet in
                    if let index = IndexSet.first{
                        viewModel.deleteTask(task: viewModel.tasks[index])
                        
                    }
                    
                }
            }//list
            .navigationTitle("To do")
            .toolbar{
                ToolbarItem{
                    Button(
                        action: {
                            showDetail = true
                            selectedTask = nil
                        })
                    {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .sheet(item: $selectedTask, content: { task in
                TaskDetailView(editingTask: task) { it in
                    viewModel.updateTask(task: it)
                    }
            })
            .sheet(isPresented: $showDetail, content: {
                TaskDetailView(editingTask: selectedTask) { it in
                    viewModel.addtask(task: it)
                }
            })
            .onAppear{
                viewModel.fetchTasks()
            }
        }//navigationStack
    }//view
}//Struct

#Preview {
    TaskListView()
}
