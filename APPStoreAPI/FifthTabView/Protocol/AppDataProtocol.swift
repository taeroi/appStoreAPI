//
//  AppDataProtocol.swift
//  AppStoreAPI
//
//  Created by 태로고침 on 2021/03/24.
//

protocol GetAppDataListViewDelegate {
    func didRetrieveAppDataInfo(_ results: [Results])
    func failedToRequestAppDataInfo(message: String)
}

protocol GetAppDataListNetworkManagerDelegate {
    func getAppDataList(delegate: GetAppDataListViewDelegate)
}
