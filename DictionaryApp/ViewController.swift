//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Yulianna on 24.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var tableView: UITableView!
    
    let headers = ["Fruits", "Vegetables", "Berries"]
    
    let words = [
    ["Apple", "Pear", "Watermelon"],
    ["Carrot", "Pickle", "Potato", "Tomato"],
    ["Strawberry", "Raspberry", "Blackberry", "Blueberry"]
    ]
    
    

    override func viewDidLoad() {
        tableView.sectionHeaderHeight = 32
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
extension ViewController: UITableViewDataSource {
    // Здесь будут наши методы dataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vegOrFruitArray = words[section] // получили массив по номеру секции
        return vegOrFruitArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        var content = cell.defaultContentConfiguration()
           content.text = words[indexPath.section][indexPath.row]
           cell.contentConfiguration = content
           return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return words.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }

}
extension ViewController: UITableViewDelegate {
    // тут располагаются методы делегата
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let alert = UIAlertController(title: nil,
                                     message: "Вы нажали на: \(words[indexPath.section][indexPath.row])",
                                     preferredStyle: .alert)
       let okAction = UIAlertAction(title: "OK", style: .default) { _ in
           alert.dismiss(animated: true)
       }
       alert.addAction(okAction)
       present(alert, animated: true)
}
       }
