//
//  DataListInfo.swift
//  AppStoreAPI
//
//  Created by 태로고침 on 2021/03/24.
//

struct AppDataInfo: Decodable {
    let resultCount: Int                //검색결과 개수
    let results: [Results]
}

struct Results: Decodable {
    let screenshotUrls: [String]        //대표사진
    let artworkUrl60: String            //아이콘
    let artistViewUrl: String           //url
    let trackName: String               //이름
    let artistName: String              //개발사
    let languageCodesISO2A: [String]    //언어
    let contentAdvisoryRating: String   //연령대
    let version: String                 //앱 버전
    let description: String             //앱 설명

    
}
