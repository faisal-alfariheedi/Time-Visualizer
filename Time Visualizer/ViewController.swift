//
//  ViewController.swift
//  Time Visualizer
//
//  Created by faisal on 05/05/1443 AH.
//







//  the app core data doesn`t save changes in time cell class
//
//
//
//
//
import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var pick: UIPickerView!
    var picklist=["sunday","monday","tuesday","wednesday","thursday","friday","saturday"]
    @IBOutlet weak var table: UITableView!
    var list=[Daywork]()
    let cr=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getall()
        print(list.count)
        table.dataSource=self
        table.delegate=self
        pick.dataSource=self
        pick.delegate=self
        // Do any additional setup after loading the view.
    }
    
    func getall() -> [Daywork] {
        
        do{
            let t=try cr.count(for: NSFetchRequest<NSFetchRequestResult>(entityName: "Daywork"))
                                  
        if (t<6){
            print("in")
            for i in 0...6{
                let thing = NSEntityDescription.insertNewObject(forEntityName: "Daywork", into: cr) as! Daywork
                var a=[" "]
                var s=[0]
                for j in 0...46{
                    a.append(" ")
                    s.append(0)
//                    thing.day!.append("")
//                    thing.daykey!.append(0)
//                    list[i].day?.append("")
//                    list[i].daykey?.append(0)
                }
                thing.day=a
                thing.daykey=s
                print(i)
            }
            if cr.hasChanges {
                do {
                    try cr.save()
                    print("Success")
                } catch {
                    print("\(error)")
                }
            }
        }else{
        
            
            let req=NSFetchRequest<NSFetchRequestResult>(entityName: "Daywork")
            do{
                let fet = try cr.fetch(req)
                list = fet as! [Daywork]
                
            }catch{
                print(error)
            }
        
    }
    }catch{
        print(error)
    }
        return list
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "timecell", for: indexPath) as! time_cell
        if(list.isEmpty){}else{
        cell.workt=list[pick.selectedRow(inComponent: 0)]
        cell.key=indexPath.row
        cell.time.text="\(indexPath.row/2):\((indexPath.row%2)*30)"
        }
        cell.keyd=pick.selectedRow(inComponent: 0)
        cell.own=self
        
        return cell
    }
    
    
}

