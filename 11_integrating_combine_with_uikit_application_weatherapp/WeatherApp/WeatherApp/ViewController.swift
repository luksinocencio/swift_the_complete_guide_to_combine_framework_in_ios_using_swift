import Combine
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var temperatureTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    private var webservice: Webservice = Webservice()
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPublisher()
        
        //        self.cancellable = self.webservice.getWeatherByCity(city: "Houston")
        //            .catch { _ in Just(Weather.placeholder) }
        //            .map { weather in
        //                if let temp = weather.temp {
        //                    return "\(temp) F"
        //                } else {
        //                    return "Error getting weather!"
        //                }
        //            }.assign(to: \.text, on: self.temperatureLabel)
    }
    
    private func setupPublisher() {
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self.temperatureTextField)
        
        self.cancellable = publisher.compactMap {
            ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        }
        .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
        .flatMap { city in
            return self.webservice.getWeatherByCity(city: city)
                .catch { _ in Just(Weather.placeholder) }
                .map { $0 }
        }.sink(receiveValue: { value in
            if let temp = value.temp {
                self.temperatureLabel.text = "\(temp) F"
            } else {
                self.temperatureLabel.text = ""
            }
        })
    }
}

