//
//  ViewController.swift
//  WebParser
//
//  Created by yy的mac on 2019/11/21.
//  Copyright © 2019 yy的mac. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController, ParserDelegate {
    
    var colors = [Color]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let parser = Parser(url: "https://irocore.com/")
        parser.delegate = self
        //p.parse()
        //p.doKanna()
        parser.doSwiftSoup()
        
        /*
        colors.append(Color(name: "Magic", colorCode: "#000000",
                            hiragana: "マジック", romanji: "majikku"))
        
        colors.append(Color(name: "Magic", colorCode: "#ff0000"))
        //print(colors[0])
        //print(UIColor(hex: colors[0].colorCode) ?? "invalid test color")
         
        colors[0].link = "https://irocore.com/aiirohatoba/"
        let r = Parser(url: "s")
        r.readDetailPage(colors[0])
         */
        
    }
    
    // MARK: - table view methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = tableView.dequeueReusableCell(withIdentifier: "Color")
        if let c = c {
            if let colorView = c.viewWithTag(1) {
                colorView.backgroundColor = UIColor(hex: colors[indexPath.row].colorCode)
            }
            if let nameLabel = c.viewWithTag(2) as? UILabel {
                nameLabel.text = colors[indexPath.row].name
            }
            if let pronounciationLabel = c.viewWithTag(3) as? UILabel {
                pronounciationLabel.text = colors[indexPath.row].romanji
            }
        }
        return c ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowStory", sender: colors[indexPath.row])
    }
    
    // MARK: - end of table view methods
    
    
    // MARK: - Parser Delegate method
    func didFinishCollectingColors(_ colorList: [Color]) {
        colors = colorList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Segue method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStory" {
            if let detailVC = segue.destination as? DetailViewController {
                if let c = sender as? Color {
                    detailVC.color = c
                }
            }
        }
    }
    
    // MARK: - Refresh Control method
    /*
    func configureRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
    }
     */


}

