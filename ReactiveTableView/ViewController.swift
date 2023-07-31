//
//  ViewController.swift
//  ReactiveTableView
//
//  Created by Ganesh on 01/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    // ------------------------------------------------------------------------------
    // MARK: DECLARED OUTLETS
    // ------------------------------------------------------------------------------
    @IBOutlet weak var tblView:UITableView!
    
    // ------------------------------------------------------------------------------
    // MARK: DECLARED VARIABLES
    // ------------------------------------------------------------------------------
    let disposeBag = DisposeBag()
    let tableViewRxItems = Observable.just(["Item:- 1", "Item:- 2","Item:- 3","Item:- 4"])
    

    // ------------------------------------------------------------------------------
    // MARK: SCREEN SETUP
    // ------------------------------------------------------------------------------
        
    // (View Did Load)
    // --------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewRx()
    }
    
    // FUNCTION: Setup TableView
    // ----------------------------
    private func setTableViewRx(){
        tableViewRxItems
            .bind(to: tblView
            .rx
            .items(cellIdentifier: "tblCell")){
                (tv,tableItems,cell) in
                cell.textLabel?.text = tableItems
            }.disposed(by: disposeBag)
    }
}

