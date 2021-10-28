//
//  FacilitiesViewController.swift
//  MVVM
//
//  Created by Raji Mac Mini on 28/10/21.
//

import UIKit

class FacilitiesViewController: UITableViewController {

    
    private var listCellDatasource = [Lists]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUp()
        
        getAppData()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell: ListTableCell = tableView.dequeueReusableCell(withIdentifier: "facilityOptionCell", for: indexPath) as? ListTableCell else {
                return UITableViewCell()
                
            }
            cell.configure(info: listCellDatasource[indexPath.section].options[indexPath.row])
            
            return cell
        
    }
    private func getAppData() {
        FacilitiesWebService.getFacilities {[weak self] (facilityList, error) in
            guard let _self = self else { return }
            _self.prepareCell(facilities: facilityList)
            DispatchQueue.main.async {
            self?.tableView.reloadData()
            }
        }
    }

    private func prepareCell(facilities: [Facility]?) {
        
        guard let facilityList = facilities else { return }
        
        //clear all previous data
        listCellDatasource.removeAll()
        
        for facility in facilityList {
            let listCellVM = Lists(title: facility.name, id: facility.facilityId, items: facility.facilityOptions, selectedOptionId: 0)
            listCellDatasource.append(listCellVM)
        }
        
    }
    
    func setUp() {
        tableView?.delegate = self
        tableView?.dataSource = self
    }

}

extension FacilitiesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCellDatasource[section].options.count
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return listCellDatasource.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = listCellDatasource[indexPath.section]
        listCellDatasource[indexPath.section] = Lists(title: item.title, id: item.id, options: item.options, selectedOptionId: item.options[indexPath.row].optionId)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listCellDatasource[section].title
    }

}
