//
//  SecondViewController.swift
//  WorkWithTableView
//
//  Created by Sergey Lukaschuk on 01.02.2022.
//

import UIKit

class SecondViewController: UIViewController {

    
    
    @IBOutlet weak var myTableView: UITableView!
    
    let identifier = "myCell"
    
    let weather = [
        "Sun ☀️",
        "Clouds ⛅️",
        "Rain 🌧",
        "Snow ❄️",
        "Thunderstorm ⚡️"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}


// MARK: - Delegate DataSource
extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = weather[indexPath.row]
        return cell
    }
    
    
}
