//
//  MapViewController.swift
//  HelpByPeopleNew
//
//  Created by Alexey Grebennikov on 12.01.22.
//

import UIKit
import MapKit
import SnapKit

class MapViewController: UIViewController, Routable {
    
    //MARK: - Properties
    
    var router: MainRouter?
    
    //MARK: - UIElements
    
    let mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red

        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    

    
    // MARK: - Private Utils
    
    private func setupViews() {
        view.addSubview(mapView)
    }

    private func setupConstraints() {
        mapView.snp.makeConstraints { make in
            make.right.left.top.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        
    }
    

}
