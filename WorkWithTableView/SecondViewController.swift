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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButton(_ sender: Any) {
        Weather.data.append("Any weather ⛄️")
        myTableView.reloadData()
    }
}

// MARK: - Delegate DataSource
extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Weather.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = Weather.data[indexPath.row]
        return cell
    }
    
    // Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Weather.data.remove(at: indexPath.row)
        }
        tableView.reloadData()
    }
}
