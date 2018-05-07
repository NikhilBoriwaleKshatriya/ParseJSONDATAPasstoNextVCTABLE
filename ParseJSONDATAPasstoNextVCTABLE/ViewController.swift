//
//  ViewController.swift
//  ParseJSONDATAPasstoNextVCTABLE
//
//  Created by nikhil boriwale on 5/7/18.
//  Copyright © 2018 infostretch. All rights reserved.
//


/// WEB SERVICE REFFERD TO PARSE GET DATA  "https://restcountries.eu/rest/v2/all"

import UIKit

struct  jsonstruct:Decodable {
    let capital : String?
    let alpha3Code : String?
    let name : String?
    let region :String?
}
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var mytable: UITableView!
    var arrdata = [jsonstruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
    }
    //data Parse using Struct & decode
    func getdata()  {
        let url = URL(string:"https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!){(data,response,error)in
           do{
                if error == nil{
                    self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                    for mainarr in self.arrdata{
                        print("alpha code :",mainarr.alpha3Code!,"capital name:",mainarr.capital!,"NAME:",mainarr.name!," Region:",mainarr.region!)
                        DispatchQueue.main.async {
                             self.mytable.reloadData()
                        }
                   
                    }
                }
             }catch{
                print("Error in get data")
            }
        }.resume()
        
        
        
    }

    
    // TABLE MEthod  :Display on table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :PassdatacellVC = tableView.dequeueReusableCell(withIdentifier: "PassdatacellVC") as! PassdatacellVC
        cell.lblname.text = arrdata[indexPath.row].name
        cell.lblcapital.text = arrdata[indexPath.row].capital
        cell.lblalphacode.text = arrdata[indexPath.row].alpha3Code
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let passdata : seconviewVCtoPassData = self.storyboard?.instantiateViewController(withIdentifier: "seconviewVCtoPassData")as! seconviewVCtoPassData
        //paas json data like this .....from table view to next Viewcontrller
        passdata.strname = arrdata[indexPath.row].name!
        passdata.strcapital = arrdata[indexPath.row].capital!
        passdata.stralphacode = arrdata[indexPath.row].alpha3Code!
        passdata.strregion = arrdata[indexPath.row].region!
        
        
        self.navigationController?.pushViewController(passdata, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

