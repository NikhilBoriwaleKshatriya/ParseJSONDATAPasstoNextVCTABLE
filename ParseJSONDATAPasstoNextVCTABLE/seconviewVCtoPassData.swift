//
//  seconviewVCtoPassData.swift
//  ParseJSONDATAPasstoNextVCTABLE
//
//  Created by nikhil boriwale on 5/7/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit

class seconviewVCtoPassData: UIViewController {

    
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var alphacode: UILabel!
    
    @IBOutlet weak var region: UILabel!
    var strname :String = ""
    var strcapital :String = ""
    var stralphacode :String = ""
    var strregion :String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        Name.text = strname
        capital.text = strcapital
        alphacode.text = stralphacode
        region.text = strregion
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
