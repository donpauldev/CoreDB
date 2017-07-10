//
//  HomeViewController.swift
//  CDataTest
//
//  Created by AJESHKUMAR CHEMPANKULAM DIVAKARAN on 08/07/17.
//  Copyright © 2017 donpaulpm. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tablV: UITableView!
    
    
    
    var task = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var backButtonImage = UIImage(named: "Menu")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
        
    }
    
    func backAct(){
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getData()
    }

    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            task = try context.fetch(Task.fetchRequest())
        }catch{
            print("Error")
        }
        tablV.reloadData()
    }
    
    // MARK: - TABLEVIEW DELAGATES Swift 3
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        
        count = task.count
        
        return count!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let taskk = task[indexPath.row]
        cell.contentView.backgroundColor = UIColor.clear
        
        var text = ""
        if taskk.isImportant{
            text = "😎 \(taskk.name!)"
        }else{
            text = "😱 \(taskk.name!)"
        }
        
        cell.textLabel?.text = text
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        if editingStyle == .delete{
            
            
            tablV.beginUpdates()
            let taskk = task[indexPath.row]
            task.remove(at: indexPath.row)
            tablV.deleteRows(at: [indexPath], with: .fade)
            tablV.endUpdates()
            
            
            context.delete(taskk)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()

            do{
                task = try context.fetch(Task.fetchRequest())
            }catch{
                print("Error")
            }
            

            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)

        
    }

    

    
}
