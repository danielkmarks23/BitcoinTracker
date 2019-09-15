import Foundation
import Charts

protocol ChartPresenting {

    func configureOnViewLoad(_ chartViewController: UIViewController & ChartViewControllerProtocol)
    func presentData(data: ExchangeRates)
}

class ChartPresenter: ChartPresenting {
    
    var chart: LineChartView?
    var infoLabel: UILabel?
    
    func configureOnViewLoad(_ chartViewController: UIViewController & ChartViewControllerProtocol) {
        
        chart = chartViewController.chart
        infoLabel = chartViewController.infoLabel
        
        chartViewController.view.backgroundColor = .white
        chart?.noDataText = "No Data"
        
        infoLabel?.text = "Info"
        infoLabel?.textAlignment = .center
        infoLabel?.numberOfLines = 2
    }
    
    func presentData(data: ExchangeRates) {
        
        infoLabel?.text = data.description
        setChart(data)
    }
    
    private func setChart(_ data: ExchangeRates) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<data.values.count {
            let dataEntry = ChartDataEntry(x: data.values[i]["x"]!, y: data.values[i]["y"]!)
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: data.unit)
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        chart?.data = lineChartData
        
        chart?.xAxis.valueFormatter = DateNameFormater()
        chart?.xAxis.granularity = 1
    }
}

final class DateNameFormater: NSObject, IAxisValueFormatter {
    
    func stringForValue( _ value: Double, axis _: AxisBase?) -> String {
        
        return convertToDateString(timeStamp: value)
    }
    
    private func convertToDateString(timeStamp: Double) -> String {
        
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
}
