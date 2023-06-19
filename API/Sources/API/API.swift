import Foundation

public struct API {
    public init() {}
    
    @MainActor
    public func make<T:Decodable>(request: URLRequest, completion:@escaping(T?,Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in

            guard let data else {
                completion(nil, error)
                return
            }

            if let error {
                completion(nil, error)
                return
            }

            let code = (response as? HTTPURLResponse)?.statusCode ?? 400
            
            switch code {
            case 0...201:
                do {
                    let wrapper = try JSONDecoder().decode(T.self, from: data)
                    completion(wrapper, nil)
                } catch {
                    completion(nil, error)
                }
            default:
                completion(nil, NSError())
            }
        }

        task.resume()
    }
}
