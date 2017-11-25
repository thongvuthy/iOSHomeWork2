//
//  AnotherViewController.swift
//  ThongVuthy_iOSHomeWork2
//
//  Created by Adimax Lee on 24/11/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import UIKit

class AnotherViewController: UIViewController {

    var data = ""
    @IBOutlet weak var labelWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            labelWelcome.text = "Welcome Mr. \(data) ! You just created Your Account"
        // Do any additional setup after loading the view.
    }

    @IBAction func didGoBack(_ sender: Any) {
        print("Go back")
        
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
