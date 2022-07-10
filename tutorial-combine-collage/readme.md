## Key points
- In your day-to-day tasks, you’ll most likely have to deal with callback or delegate-based APIs. Luckily, those are easily wrapped as futures or publishers by using a subject.
- Moving from various patterns like delegation and callbacks to a single Publisher/Subscriber pattern makes mundane tasks like presenting views and fetching back values a breeze.
- To avoid unwanted side-effects when subscribing a publisher multiple times, use a shared publisher via the share() operator.


### convert closure to Future

Function
```  
  static func save(_ image: UIImage) -> Future<String, PhotoWriter.Error> {
    Future { resolve in
      do {
        try PHPhotoLibrary.shared().performChangesAndWait {
          let request = PHAssetChangeRequest.creationRequestForAsset(from: image)
          
          guard let savedAssetID = request.placeholderForCreatedAsset?.localIdentifier else { return resolve(.failure(.couldNotSavePhoto)) }
          resolve(.success(savedAssetID))
        }
      }
      catch {
        resolve(.failure(.generic(error)))
      }
    }
  }
  
```

Caller
```
PhotoWriter.save(image)
      .sink(
        receiveCompletion: { [unowned self] completion in
          if case .failure(let error) = completion {
            lastErrorMessage = error.localizedDescription
          }
          clear()
        },
        receiveValue: { [unowned self] id in
          lastSavedPhotoID = id
        }
      )
      .store(in: &subscriptions)
      
```
   
