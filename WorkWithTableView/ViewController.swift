//
//  ViewController.swift
//  WorkWithTableView
//
//  Created by Sergey Lukaschuk on 29.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let emoji = [
        [ "Apple 🍎", "Orange 🍊", "Banana 🍌"],
        [ "Cat 🐈‍⬛", "Dog 🐕", "Bird 🦜", "Mous 🐁"],
        [ "Smile 🤣", "Cry 😭", "Happy 😁", "Love 😍", "Slip 😴"]
    ]
    
    private var myTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
    }
    
    // MARK: - Configure Table
    private func createTable() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "idCell")
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(myTableView)
    }
    
}

// MARK: - Delegate DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        emoji.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var nameSection: String?
        
        switch section {
        case 0: nameSection = "Fruit"
        case 1: nameSection = "Animal"
        case 2: nameSection = "Emotions"
        default: nameSection = nil
        }
        return nameSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return emoji[0].count
        case 1: return emoji[1].count
        case 2: return emoji[2].count
        default:
            return 0
        }
    }
    
    // MARK: - Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        cell.textLabel?.text = emoji[indexPath.section][indexPath.row]
        
        // Color Cell
        switch indexPath.section {
        case 0: cell.backgroundColor = UIColor.red
        case 1: cell.backgroundColor = UIColor.blue
        case 2: cell.backgroundColor = UIColor.green
        default:
            cell.backgroundColor = .gray
        }
        
        return cell
    }
}
