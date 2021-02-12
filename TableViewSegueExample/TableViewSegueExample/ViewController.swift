//
//  ViewController.swift
//  TableViewSegueExample
//
//  Created by Ануар Беисов on 11.02.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var students = [Student.init("Wasya Pupkin", "3.4", UIImage.init(named: "female")!),
                    Student.init("Darkhan Kuanyshbay", "4.0", UIImage.init(named: "female")!)]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.studentName.text = students[indexPath.row].name_surname
        cell?.studendGpa.text = students[indexPath.row].gpa
        cell?.studentImageView.image = students[indexPath.row].image
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    let detailVC = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
    //    navigationController?.pushViewController(detailVC, animated: true)
        
        
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = (myTableView.indexPathForSelectedRow?.row)!
        let destination = segue.destination as! DetailViewController
        destination.name_surname = students[index].name_surname
    }

}

