import UIKit
import Charts

protocol ChartViewControllerProtocol {

    var chart: LineChartView! { get set }
    var infoLabel: UILabel! { get set }

}

public class ChartViewController: UIViewController, ChartViewControllerProtocol {
    
    var coordinator: ChartCoordinating!
    var chart: LineChartView!
    var infoLabel: UILabel!
}

// MARK: View Lifecycle
extension ChartViewController {
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        
        chart = LineChartView(frame: CGRect(x: 0, y: 40, width: view.bounds.width, height: view.bounds.height - 100))
        infoLabel = UILabel(frame: CGRect(x: 0, y: chart.frame.size.height + 40, width: view.bounds.width, height: 50))
        
        view.addSubview(chart)
        view.addSubview(infoLabel)
        
        coordinator.viewControllerViewDidLoad(viewController: self)
    }
}
