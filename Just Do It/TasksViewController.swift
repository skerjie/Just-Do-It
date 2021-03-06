//
//  TasksViewController.swift
//  Just Do It
//
//  Created by Andrei Palonski on 19.09.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  //var selectedIndex = 0
  var tasks : [Task] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // для градиента фона
//    let background = CAGradientLayer().gradNiceColor()
//    background.frame = self.view.bounds
//    self.view.layer.insertSublayer(background, at: 0)
    
    //self.tableView.layer.insertSublayer(background, at: 0)
    
    // Do any additional setup after loading the view, typically from a nib.
    
    // tasks = makeTask()
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    getTasks()
    tableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    let task = tasks[indexPath.row]
    if task.isImportant {
      cell.textLabel?.text = "❗️\(task.name!)" // ! чтобы убрать слово Optional
    } else {
      cell.textLabel?.text = task.name! // ! чтобы убрать слово Optional
      
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    // selectedIndex = indexPath.row
    let task = tasks[indexPath.row]
    performSegue(withIdentifier: "selectedTaskSegue", sender: task)
  }
  
  //  func makeTask() -> [Task] {
  //    let task1 = Task()
  //    task1.name = "Walk the dog"
  //    task1.isImportant = false
  //
  //    let task2 = Task()
  //    task2.name = "Play with Steshka"
  //    task2.isImportant = true
  //
  //    let task3 = Task()
  //    task3.name = "To be boo with my Cru"
  //    task3.isImportant = false
  //
  //    return [task1,task2,task3]
  //  }
  
  @IBAction func plusTapped(_ sender: AnyObject) {
    performSegue(withIdentifier: "addSegue", sender: nil)
  }
  
  func getTasks() {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
      tasks = try context.fetch(Task.fetchRequest()) as [Task]
    } catch {
      print(error.localizedDescription)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //    if segue.identifier == "addSegue" {
    //      let nextVC = segue.destination as! CreateTaskViewController
    //      // создаем свойство nextVC к которому обращаются из CreateTaskViewController оно как бы говорит эй, CreateTaskViewController у тебя есть свойство previousVC и оно ссылается на меня
    //      nextVC.previousVC = self
    //    }
    
    if segue.identifier == "selectedTaskSegue" {
      let nextVC = segue.destination as! CompleteTaskViewController
      nextVC.task = sender as? Task
      // nextVC.previousVC = self
    }
  }
  
}

