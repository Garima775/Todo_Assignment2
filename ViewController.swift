//
//  File name- ViewController.swift
//  Author name- Garima Prasher
// App Name- ToDo Assignment2

// Student ID- 301093329
// file Description: this is the main Todo List screen
//  Copyright © 2019 Garima Prasher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var todoTableView: UITableView!
    var todos: [String] = ["Get Groceries" , "buy strawberries", "Go to Gym", "Children from School", "Complete Todo Assignment"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.rowHeight = 35
        
    }
    
    
    @IBAction func addTodo(_ sender: UIButton) { //this is the add button by which user can add more todo tasks to the table view
        
        let todoAlert = UIAlertController(title: "Add Todo", message: "Add a new Todo", preferredStyle: .alert)
        todoAlert.addTextField()
        
        let addTodoAction = UIAlertAction(title: "Add", style: .default) {(action) in
            let newTodo = todoAlert.textFields![0]
            self.todos.append(newTodo.text!)
            self.todoTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        todoAlert.addAction(addTodoAction)
        todoAlert.addAction(cancelAction)
        
        present(todoAlert, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoCell
        
        cell.todoLabel.text = todos[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TodoCell
        if cell.isChecked == false
        {
            cell.checkmarkImage.image = UIImage(named: "checkmark.png")
            cell.isChecked = true
        }
        else {
            cell.checkmarkImage.image = nil
            cell.isChecked = false
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
        todos.remove(at: indexPath.row)
        todoTableView.reloadData()
    }
        
    }
}


