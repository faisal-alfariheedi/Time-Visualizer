//
//  time cell.swift
//  Time Visualizer
//
//  Created by faisal on 08/05/1443 AH.
//

import UIKit
import CoreData

class time_cell: UITableViewCell {
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var work: UITextField!
    
    var workt : Daywork?
    var key=0
    var cr:NSManagedObjectContext?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        work.text=workt?.day![key]
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func edend(_ sender: UITextField) {
        workt!.day![key]=String(work.text!)
        var a = workt!.day![key]
        print(workt!.day![key])
        if(a.contains("ios") || a.contains("swift") ){
            workt!.daykey![key]=1
        }else if(a.contains("algo") || a.contains("data str")){
            workt!.daykey![key]=2
        }else if(a.contains("uikit") || a.contains("swift ui")){
            workt!.daykey![key]=3
        }
        if cr!.hasChanges {
            do {
                try cr!.save()
                print("Success")
            } catch {
                print("\(error)")
            }
        }
    }
    
}
