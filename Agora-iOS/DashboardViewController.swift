//
//  ViewController.swift
//  Agora-iOS
//
//  Created by Hridik Punukollu on 21/03/20.
//  Copyright © 2020 Hridik Punukollu. All rights reserved.
//

import UIKit
import RealmSwift

class DashboardViewController: UITableViewController {
    
    let cellLabels = ["Total Elections", "Active Elections", "Completed Elections", "Pending Elections"]
    let cellColours = [#colorLiteral(red: 0.04666187614, green: 0.2630045414, blue: 0.5235590339, alpha: 1), #colorLiteral(red: 1, green: 0.3137688041, blue: 0.2429715395, alpha: 1), #colorLiteral(red: 0.02400839329, green: 0.433147788, blue: 0.298322171, alpha: 1), #colorLiteral(red: 0.9524005055, green: 0.7155768275, blue: 0, alpha: 1)]
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavBar()
        setUpTableview()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellLabels.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let electionList = realm.objects(ElectionData.self)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dashboardCell") as! DashboardTableViewCell
        cell.titleLabel.text = cellLabels[indexPath.row]
        cell.cellIcon.image = UIImage(named: cellLabels[indexPath.row])
        cell.bgView.backgroundColor = cellColours[indexPath.row]
//        cell.electionCounter.text = "\(electionList.count)"
        setElectionCount(cell: cell, indexPath: indexPath, electionList: electionList)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setUpNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0.5324117541, blue: 0.3027513623, alpha: 1)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func setUpTableview() {
        tableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        tableView.register(UINib(nibName: "DashboardTableViewCell", bundle: nil), forCellReuseIdentifier: "dashboardCell")
    }
    
    func setElectionCount(cell: DashboardTableViewCell, indexPath: IndexPath, electionList: Results<ElectionData>) {
        
        var counter: Int = 0
        
        switch indexPath.row {
        case 0:
            cell.electionCounter.text = "\(electionList.count)"
            break
        case 1:
            for election in electionList {
                if election.endingDate > Date() && election.startingDate < Date(){
                    counter += 1
                }
            }
            cell.electionCounter.text = "\(counter)"
            break
        case 2:
            for election in electionList {
                if election.endingDate < Date(){
                    counter += 1
                }
            }
            cell.electionCounter.text = "\(counter)"
            break
        case 3:
            for election in electionList {
                if election.startingDate > Date(){
                    counter += 1
                }
            }
            cell.electionCounter.text = "\(counter)"
            break
        default:
            cell.electionCounter.text = "0"
        }
        
    }
    
    
}

