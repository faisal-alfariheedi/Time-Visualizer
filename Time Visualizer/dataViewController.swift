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
    var tel  = PieChartDataEntry(value: 0) , blu  = PieChartDataEntry(value: 0) , pur  = PieChartDataEntry(value: 0)
//    tel.label=""
//    blu.label=""
//    pur.label=""
    var dtel=LineChartDataSet(entries: [ChartDataEntry(x: 0, y: 0),ChartDataEntry(x: 1, y: 0),ChartDataEntry(x: 2, y: 0),ChartDataEntry(x: 3, y: 0),ChartDataEntry(x: 4, y: 0),ChartDataEntry(x: 5, y: 0),ChartDataEntry(x: 5, y: 0)], label: "")
    var dblu=LineChartDataSet(entries: [ChartDataEntry(x: 0, y: 0),ChartDataEntry(x: 1, y: 0),ChartDataEntry(x: 2, y: 0),ChartDataEntry(x: 3, y: 0),ChartDataEntry(x: 4, y: 0),ChartDataEntry(x: 5, y: 0),ChartDataEntry(x: 5, y: 0)], label: "")
    var dpur=LineChartDataSet(entries: [ChartDataEntry(x: 0, y: 0),ChartDataEntry(x: 1, y: 0),ChartDataEntry(x: 2, y: 0),ChartDataEntry(x: 3, y: 0),ChartDataEntry(x: 4, y: 0),ChartDataEntry(x: 5, y: 0),ChartDataEntry(x: 5, y: 0)], label: "")
    @IBOutlet weak var pie: PieChartView!
    @IBOutlet weak var line: LineChartView!
    var lv=0
    
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
                    case 1: tel.value+=1;dtel.entries[weeklist.firstIndex(of: i)!].y+=1
                    case 2: blu.value+=1;dblu.entries[weeklist.firstIndex(of: i)!].y+=1
                    case 3: pur.value+=1;dpur.entries[weeklist.firstIndex(of: i)!].y+=1
                    default: break
                }
                
            }
        }
    }
    
    @IBAction func rightswipe(_ sender: UISwipeGestureRecognizer) {
        if lv<1 {
            line.isHidden=true
            pie.isHidden=false
        }else{
            performSegue(withIdentifier: "ch", sender: "a")
        }
        
        
    }
    @IBAction func leftswipe(_ sender: UISwipeGestureRecognizer) {
        if lv==0 {
            pie.isHidden=true
            line.isHidden=false
        }	
        
    }
}
extension dataViewController:UITableViewDelegate,UITableViewDataSource,ChartViewDelegate{
    
    
    
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
        
//        switch weeklist[0].daykey![indexPath.row]{
//            case 1:cell.sun.backgroundColor = .systemTeal;dtel.entries[0]+=1
//            case 2:cell.sun.backgroundColor = .systemBlue;dblu.entries[0]+=1
//            case 3:cell.sun.backgroundColor = .systemPurple;dpur.entries[0]+=1
//            default: break
//        }
//        switch weeklist[1].daykey![indexPath.row]{
//            case 1:cell.mon.backgroundColor = .systemTeal;dtel.entries[1]+=1
//            case 2:cell.mon.backgroundColor = .systemBlue;dblu.entries[1]+=1
//            case 3:cell.mon.backgroundColor = .systemPurple;dpur.entries[1]+=1
//            default: break
//        }
//        switch weeklist[2].daykey![indexPath.row]{
//            case 1:cell.tue.backgroundColor = .systemTeal;dtel.entries[2]+=1
//            case 2:cell.tue.backgroundColor = .systemBlue;dblu.entries[2]+=1
//            case 3:cell.tue.backgroundColor = .systemPurple;dpur.entries[2]+=1
//            default: break
//        }
//        switch weeklist[3].daykey![indexPath.row]{
//            case 1:cell.wed.backgroundColor = .systemTeal;dtel.entries[3]+=1
//            case 2:cell.wed.backgroundColor = .systemBlue;dblu.entries[3]+=1
//            case 3:cell.wed.backgroundColor = .systemPurple;dpur.entries[3]+=1
//            default: break
//        }
//        switch weeklist[4].daykey![indexPath.row]{
//            case 1:cell.thu.backgroundColor = .systemTeal;dtel.entries[4]+=1
//            case 2:cell.thu.backgroundColor = .systemBlue;dblu.entries[4]+=1
//            case 3:cell.thu.backgroundColor = .systemPurple;dpur.entries[4]+=1
//            default: break
//        }
//        switch weeklist[5].daykey![indexPath.row]{
//            case 1:cell.fri.backgroundColor = .systemTeal;dtel.entries[5]+=1
//            case 2:cell.fri.backgroundColor = .systemBlue;dblu.entries[5]+=1
//            case 3:cell.fri.backgroundColor = .systemPurple;dpur.entries[5]+=1
//            default: break
//        }
//        switch weeklist[6].daykey![indexPath.row]{
//            case 1:cell.sat.backgroundColor = .systemTeal;dtel.entries[6]+=1
//            case 2:cell.sat.backgroundColor = .systemBlue;dblu.entries[6]+=1
//            case 3:cell.sat.backgroundColor = .systemPurple;dpur.entries[6]+=1
//            default: break
//        }
               
        return cell
    }
    
    
}
