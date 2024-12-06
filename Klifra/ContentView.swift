import SwiftUI
import MapKit

struct AlertMessage: Identifiable {
    let id = UUID()
    let message: String
}

struct Location: Identifiable {
    let id = UUID()
    let crag: Crag
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 45.2538, longitude: -69.4455),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5) // Adjust zoom level for Maine
    )

    @State private var cragLocations: [Location] = []
    @State private var isLoading = false
    @State private var errorMessage: AlertMessage? = nil

    var body: some View {
        NavigationView {
            VStack {
                Map(coordinateRegion: $region, annotationItems: cragLocations) { location in
                        MapAnnotation(coordinate: location.coordinate) {
                            NavigationLink(destination: CragDetailView(crag: location.crag)) {
                                Image(systemName: "pin.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.title)
                            }
                        }
                    }
            }
            .onAppear {
                fetchCragLocations()
            }
        }
        .alert(item: $errorMessage) { alertMessage in
            Alert(
                title: Text("Error"),
                message: Text(alertMessage.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    func fetchCragLocations() {
        isLoading = true
        CragService.fetchCrags { crags, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = AlertMessage(message: error.localizedDescription)
                } else if let crags = crags {
                    // Convert crags to locations based on approach GPS coordinates
                    self.cragLocations = crags.map { crag in
                        Location(
                            crag: crag,
                            coordinate: CLLocationCoordinate2D(
                                latitude: crag.approach.GPScoords.lat,
                                longitude: crag.approach.GPScoords.long
                            )
                        )
                    }
                }
                isLoading = false
            }
        }
    }
}
