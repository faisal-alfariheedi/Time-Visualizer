//
//  ViewController.swift
//  Time Visualizer
//
//  Created by faisal on 05/05/1443 AH.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var pick: UIPickerView!
    var picklist=[String]()
    @IBOutlet weak var table: UITableView!
    var list=[Daywork]()
    let cr=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource=self
        table.delegate=self
        // Do any additional setup after loading the view.
    }
    
    func getall(){
        let req=NSFetchRequest<NSFetchRequestResult>(entityName: "Daywork")
        do{
            let fet = try cr.fetch(req)
            list = fet as! [Daywork]
            
        }catch{
            print(error)
        }
        if (list.isEmpty){
            for i in 0...6{
                for j in 0...47
                        list[i].day.append("")
                        list[i].dayk.append(0)
            }
        }
    }
    
    
    @IBAction func add(_ sender: UIButton) {
    }
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picklist.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picklist[row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "timecell", for: indexPath) as! time_cell
        cell.workt=list[indexPath.row]
        cell.key=indexPath.row
        
        return cell
    }
    
    
}

