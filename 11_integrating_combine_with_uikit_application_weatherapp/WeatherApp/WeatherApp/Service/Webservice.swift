import Combine
import Foundation

class Webservice {
    func getWeatherByCity(city: String) -> AnyPublisher<Weather, Error> {
        guard let url = Constants.Urls.weatherByCity(city: city) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map { $0.main }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
