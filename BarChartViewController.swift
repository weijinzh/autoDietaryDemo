//
//  BarGraphViewController.swift
//  AutoDietaryApp
//
//  Created by Weijin on 3/10/19.
//  Copyright © 2019 Weijin. All rights reserved.
//

import UIKit
import Charts
class BarChartViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    var itemsToPlot:[String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsToPlot = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
        let timeUsed = [1.1,1.3,1.2,1.5,1.7]
        barChartUpdate(items:itemsToPlot,values:timeUsed)
    }
    

    func barChartUpdate(items:[String],values:[Double]){
        barChartView.backgroundColor = UIColor.white
        var numberOfItems = 1.0
        var counter = 0
        var dataList:[BarChartDataEntry] = []
        while counter < items.count{
            let entry = BarChartDataEntry(x:numberOfItems,y:values[counter])
            dataList.append(entry)
            counter+=1
            numberOfItems+=1.0
        }
        let dataSet = BarChartDataSet(values:dataList,label:"Time(Hours)")
        dataSet.colors = ChartColorTemplates.joyful()
        let data = BarChartData(dataSets: [dataSet])
        barChartView.data = data
    }

  

}
