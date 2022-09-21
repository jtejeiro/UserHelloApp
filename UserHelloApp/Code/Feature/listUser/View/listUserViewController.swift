//
//  listUserViewController.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation


class listUserViewController: BaseViewController {
    
    
    // MARK: - Properties
    var presenter: listUserPresenter?
    
    @IBOutlet weak var tableView:UITableView!
    
    private var viewModel:listUserViewModel!

    //MARK: - View Life Cycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoading()
        self.presenter?.viewDidLoad()
        setupInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.viewDidAppear()
    }
    
    
    // MARK: IBActions
    
    @IBAction func oderByDateButtonAction(_ sender: Any) {
        self.viewModel.orderByDateListUser()
        self.refreshTableView()
    }
    
    @objc func AddButtonPressed(sender: Any) {
        presenter?.showAddViewController()
    }
    
    @objc func refreshButtonPressed(sender: Any) {
        self.presenter?.reloadListUserView()
        self.refreshTableView()
    }
    
}
// MARK: - BillViewController
extension listUserViewController: listUserView {
    func showlistUser(listUserVM: listUserViewModel) {
        stopLoading()
        self.viewModel = listUserVM
        configView()
    }
    
    func showAlertError(title: String, message: String) {
        
    }
    
}
// MARK: - Private methods
private extension listUserViewController {
    
    // MARK: - Setup
    func setupInit() {
        self.navigationItem.title = "Title_Hello".sLocalized
        configNavigationButton()
    }
    
    func configView() {
        configTableView()
        refreshTableView()
    }
    
    func configNavigationButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddButtonPressed))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonPressed))
    }
    
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(listUserTableViewCell.nib(), forCellReuseIdentifier: listUserTableViewCell.name())
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    func refreshTableView(){
        self.tableView.reloadData()
    }

}

extension listUserViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: listUserTableViewCell.name(), for: indexPath) as? listUserTableViewCell else{
            return listUserTableViewCell()
        }
        
        cell.setupCell(user: viewModel.userList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")
          let cellID = viewModel.userList[indexPath.row].id
          let cellStringID = String(cellID)
          presenter?.deleteListUser(cellStringID)
      }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellID = viewModel.userList[indexPath.row].id
        let cellStringID = String(cellID)
        self.presenter?.showDetailViewController(userID: cellStringID)
    }
}

extension listUserViewController: addUserPopUpDelegate {
    
    func addUserCloseViewController() {
        self.presenter?.reloadListUserView()
        self.refreshTableView()
    }
}
