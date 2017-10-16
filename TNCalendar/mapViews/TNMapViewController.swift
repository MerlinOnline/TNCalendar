//
//  TNMapViewController.swift
//  TNCalendar
//
//  Created by merrill on 2017/10/13.
//  Copyright © 2017年 merrill. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class TNMapViewController: TNBaseViewController , MKMapViewDelegate {
    
    var mainMapView : MKMapView?
    
    let locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //使用代码创建
        self.mainMapView = MKMapView(frame:self.view.frame)
        self.view.addSubview(self.mainMapView!)
        
        self.mainMapView?.delegate = self
        
        //地图类型设置 - 标准地图
        self.mainMapView?.mapType = MKMapType.satellite
        
        //创建一个MKCoordinateSpan对象，设置地图的范围（越小越精确）
        let latDelta = 0.05
        let longDelta = 0.05
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        //定义地图区域和中心坐标（
        //使用当前位置
        //var center:CLLocation = locationManager.location.coordinate
        //使用自定义位置
        let center:CLLocation = CLLocation(latitude: 32.029171, longitude: 118.788231)
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate,
                                                                  span: currentLocationSpan)
        
        //设置显示区域
        self.mainMapView?.setRegion(currentRegion, animated: true)
        
        //创建一个大头针对象
        let objectAnnotation = MKPointAnnotation()
        //设置大头针的显示位置
        objectAnnotation.coordinate = CLLocation(latitude: 32.029171,
                                                 longitude: 118.788231).coordinate
        //设置点击大头针之后显示的标题
        objectAnnotation.title = "南京夫子庙"
        //设置点击大头针之后显示的描述
        objectAnnotation.subtitle = "南京市秦淮区秦淮河北岸中华路"
        //添加大头针
        self.mainMapView?.addAnnotation(objectAnnotation)
    }
    
    //当地图获取到用户的位置的时候回调用该方法
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        //MKUserLocation 大头数据模型 只要遵守了MKAnnotation就是大头针数据模型
        //获取用户的大头针数据模型
        userLocation.title = "肖锋"
        userLocation.subtitle = "你好吗????"
        //获取用户当前的中心位置
        let center = userLocation.location?.coordinate
        mapView.setCenter(center!, animated: true)
        
        //改变显示区域
        let span = MKCoordinateSpanMake(0.162493481087147, 0.10857004327103)
        let region = MKCoordinateRegionMake(center!, span)
        mapView.setRegion(region, animated: true)
    }
    
    //当区域改变的时候会调用该方法
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(mapView.region.span)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
}
