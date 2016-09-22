//
//  CreateTaskViewController.swift
//  Just Do It
//
//  Created by Andrei Palonski on 20.09.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var importantSwitch: UISwitch!
  
  var previousVC = TasksViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func addButtonTapped(_ sender: AnyObject) {
    // создание нового задания из аутлетов
    let task = Task()
    task.name = nameTextField.text!
    task.isImportant = importantSwitch.isOn
   
    // добавление задания к массиву заданий [Task] из другого ViewController'a
    previousVC.tasks.append(task)
    // обновляем информацию о заданиях после добавления
    previousVC.tableView.reloadData()
    // после нажатия кнопки Add автоматически возвращаемся на предыдущий ViewController
    navigationController!.popViewController(animated: true)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
