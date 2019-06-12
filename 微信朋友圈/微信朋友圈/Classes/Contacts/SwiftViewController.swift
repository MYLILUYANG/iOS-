//
//  SwiftViewController.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/6/12.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let dataArray = ["闭包", "02", "03"];
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath);
        cell.textLabel?.text = dataArray[indexPath.row];
        return cell;
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: K_ScreenW, height: K_ScreenH), style: UITableView.Style.plain);
        self.view .addSubview(tableView);
        tableView.delegate = self;
        tableView.dataSource = self;
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId");
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("bibao");
            
            let names = ["1", "a", "3", "c", "2", "b", "5", "e", "4", "d", "6", "f"];
            let reversedName = names.sorted {  s1, s2  in return s1 < s2; };
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
