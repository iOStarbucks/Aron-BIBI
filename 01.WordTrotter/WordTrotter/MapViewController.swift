//
//  MapViewController.swift
//  WordTrotter
//
//  Created by 소영 on 2018. 9. 30..
//  Copyright © 2018년 소영. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
//    MKMapView형
    var mapView: MKMapView!
    
    override func loadView() {
//        지도 뷰 생성. 초기화
        mapView = MKMapView()
//        지도 뷰를 이 뷰 컨트롤러의 view로 설정
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
//        segmentedControl.addTarget(self, action: Selector(("mapTypeChanged:")), for: .valueChanged)
        
        //        기본 변환을 사용하지 않도록 : 명시적 제약 조건과 충돌해서 문제를 일으킴
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
//        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
//        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    override func viewDidLoad(){
        //        supper의 viewDidLoad 구현을 항상 호출한다
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    @objc
    func mapTypeChanged(segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
}
