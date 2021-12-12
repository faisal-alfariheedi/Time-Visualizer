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
    let cr=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        time.text="\(key/2):\((key%2)*30)"
        work.text=workt.day[key]
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func edend(_ sender: UITextField) {
        workt.day[key]=String(work.text!)
        if cr.hasChanges {
            do {
                try cr.save()
                print("Success")
            } catch {
                print("\(error)")
            }
        }
    }
    
}
