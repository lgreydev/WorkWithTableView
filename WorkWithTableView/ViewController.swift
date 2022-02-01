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
        return emoji.count
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
    
    // Title Section
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 50))
//
//        switch section {
//        case 0: headerView.backgroundColor = .red.withAlphaComponent(0.2)
//        case 1: headerView.backgroundColor = .green
//        case 2: headerView.backgroundColor = .blue
//        default: break
//        }
//        return headerView
//    }

    // MARK: - Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        cell.textLabel?.text = emoji[indexPath.section][indexPath.row]
        
        cell.accessoryType = .detailButton
        
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
    
    // Accessory Button
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if let textLabel = cell?.textLabel?.text {
            print(textLabel)
        }
    }
    
    // Row Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        30
    }
    
    // Row Tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = """
                   section index: \(indexPath.section)
                   row index: \(indexPath.row)
                   """
        print(text)
    }
}
