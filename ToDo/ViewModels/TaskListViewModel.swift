//
//  TaskListViewModel.swift
//  ToDo
//
//  Created by Andrea Torres on 28/04/25.
//
import Foundation

class TaskListViewModel: ObservableObject {
    @Published var  title = ""
    @Published var tasks = [Task] ()
    let taskDao = TaskDao()
    
    func fetchTasks() {
        tasks = taskDao.fetchTasks().map({entity in
            Task(id: entity.id ?? UUID(), title: entity.title ?? "", creqatedAt: entity.createAt ?? Date(), dueDate: entity.dueDate ?? Date())})
    }
    
    //antes de los : es nombre del parametro y dsp de : es el valor
    
    func addtask(task: Task) {
        taskDao.addTask(task: task)
        fetchTasks()
    }
    
    func deleteTask(task: Task){
        taskDao.deleteTask(task: task)
        fetchTasks()
    }
    
    func updateTask(task: Task){
        taskDao.updateTask(task: task)
        fetchTasks()
        
        }
    }


