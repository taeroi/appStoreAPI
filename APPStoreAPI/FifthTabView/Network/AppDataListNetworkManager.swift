//
//  AppDataNetworkManager.swift
//  AppStoreAPI
//
//  Created by 태로고침 on 2021/03/24.
//

import UIKit


class AppDataListNetworkManager: GetAppDataListNetworkManagerDelegate {
    
    let session = URLSession.shared
        func getAppDataList(delegate: GetAppDataListViewDelegate) {
            guard let requestUrl = URL(string: "\(Constant.BASE_URL)") else {return}
            let dataTask = session.dataTask(with: requestUrl){ (data: Data?, response: URLResponse?, error: Error?) in
                DispatchQueue.main.async {
                    guard let jsonData = data else {
                        delegate.failedToRequestAppDataInfo(message: "Failed to request app data list")
                        print(error!.localizedDescription)
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let appData = try decoder.decode(AppDataInfo.self, from: jsonData)
                        delegate.didRetrieveAppDataInfo(appData.results)
                        print(appData)
                        print("Success to request data")
                    } catch {
                        delegate.failedToRequestAppDataInfo(message: "Failed to request app data list")
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
        }
    
}
