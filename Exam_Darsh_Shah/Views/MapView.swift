//
//  MapView.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//


import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D
    let title: String

    func makeUIView(context: Context) -> MKMapView { MKMapView() }
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeAnnotations(mapView.annotations)
        let ann = MKPointAnnotation()
        ann.coordinate = coordinate
        ann.title = title
        mapView.addAnnotation(ann)

        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
        mapView.setRegion(region, animated: true)
    }
}
