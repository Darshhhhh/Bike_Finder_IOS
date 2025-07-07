//
//  FavoritesController.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//


import CoreData

final class FavoritesController {
    private let ctx = PersistenceController.shared.container.viewContext

    func allFavorites() -> [FavoriteLocation] {
        let req: NSFetchRequest<FavoriteLocation> = FavoriteLocation.fetchRequest()
        return (try? ctx.fetch(req)) ?? []
    }

    func isFav(_ id: String) -> Bool {
        let req: NSFetchRequest<FavoriteLocation> = FavoriteLocation.fetchRequest()
        req.predicate = NSPredicate(format: "id == %@", id)
        let count = (try? ctx.count(for: req)) ?? 0
        return count > 0
    }

    func add(_ net: CityBikeNetwork) -> Bool {
        if isFav(net.id) { return false }
        let fav = FavoriteLocation(context: ctx)
        fav.id        = net.id
        fav.city      = net.location.city
        fav.country   = net.location.country
        fav.company   = net.company?.joined(separator: ", ")
        fav.latitude  = net.location.latitude
        fav.longitude = net.location.longitude
        save()
        return true
    }

    func remove(_ id: String) {
        let req: NSFetchRequest<FavoriteLocation> = FavoriteLocation.fetchRequest()
        req.predicate = NSPredicate(format: "id == %@", id)
        if let obj = (try? ctx.fetch(req))?.first {
            ctx.delete(obj)
            save()
        }
    }

    private func save() {
        if ctx.hasChanges {
            try? ctx.save()
        }
    }
}
