//
//  dataViewController.swift
//  Time Visualizer
//
//  Created by faisal on 08/05/1443 AH.
//

import UIKit
import CoreData
import Charts

class dataViewController: UIViewController {
    @IBOutlet weak var weektable: UITableView!
    var weeklist = [Daywork]()
    let cr=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tel  = 0 , blu  = 0 , pur  = 0
    @IBOutlet weak var pie: PieChartView!
    @IBOutlet weak var line: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getall()
        
        // Do any additional setup after loading the view.
    }
    func getall(){
        let req=NSFetchRequest<NSFetchRequestResult>(entityName: "Daywork")
        do{
            let fet = try cr.fetch(req)
            weeklist = fet as! [Daywork]
            
        }catch{
            print(error)
        }
        for i in weeklist{
            for j in i.daykey!{
                switch j {
                    case 1: tel+=1
                    case 2: blu+=1
                    case 3: pur+=1
                    default: break
                }
                
            }
        }
    }
    
}
extension dataViewController:UITableViewDelegate,UITableViewDataSource,PieChartDataEntry,PieChartData{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weektable.dequeueReusableCell(withIdentifier: "weekcell", for: indexPath) as! weekcell
        cell.time.text="\(indexPath.row/2):\((indexPath.row%2)*30)"
        cell.sun.text=":\(weeklist[0].day![indexPath.row])"
        cell.mon.text=":\(weeklist[1].day![indexPath.row])"
        cell.tue.text=":\(weeklist[2].day![indexPath.row])"
        cell.wed.text=":\(weeklist[3].day![indexPath.row])"
        cell.thu.text=":\(weeklist[4].day![indexPath.row])"
        cell.fri.text=":\(weeklist[5].day![indexPath.row])"
        cell.sat.text=":\(weeklist[6].day![indexPath.row])"
        
        switch weeklist[0].daykey![indexPath.row]{
            case 1:cell.sun.backgroundColor = .systemTeal
            case 2:cell.sun.backgroundColor = .systemBlue
            case 3:cell.sun.backgroundColor = .systemPurple
            default: break
        }
        switch weeklist[1].daykey![indexPath.row]{
            case 1:cell.mon.backgroundColor = .systemTeal
            case 2:cell.mon.backgroundColor = .systemBlue
            case 3:cell.mon.backgroundColor = .systemPurple
            default: break
        }
        switch weeklist[2].daykey![indexPath.row]{
            case 1:cell.tue.backgroundColor = .systemTeal
            case 2:cell.tue.backgroundColor = .systemBlue
            case 3:cell.tue.backgroundColor = .systemPurple
            default: break
        }
        switch weeklist[3].daykey![indexPath.row]{
            case 1:cell.wed.backgroundColor = .systemTeal
            case 2:cell.wed.backgroundColor = .systemBlue
            case 3:cell.wed.backgroundColor = .systemPurple
            default: break
        }
        switch weeklist[4].daykey![indexPath.row]{
            case 1:cell.thu.backgroundColor = .systemTeal
            case 2:cell.thu.backgroundColor = .systemBlue
            case 3:cell.thu.backgroundColor = .systemPurple
            default: break
        }
        switch weeklist[5].daykey![indexPath.row]{
            case 1:cell.fri.backgroundColor = .systemTeal
            case 2:cell.fri.backgroundColor = .systemBlue
            case 3:cell.fri.backgroundColor = .systemPurple
            default: break
        }
        switch weeklist[6].daykey![indexPath.row]{
            case 1:cell.sat.backgroundColor = .systemTeal
            case 2:cell.sat.backgroundColor = .systemBlue
            case 3:cell.sat.backgroundColor = .systemPurple
            default: break
        }
               
        return cell
    }
    
    
}
