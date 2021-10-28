//
//  FacilitiesWebService.swift
//  MVVM
//
//  Created by Raji Mac Mini on 28/10/21.
//

import Foundation

struct FacilitiesWebService {
    
    static func getFacilities(callback: @escaping ([Facility]?, Error?) -> ()) {
        HttpManager.sharedService.requestAPI(url: WebServiceConstants.facitlitiesURL, parameter: nil, httpMethodType: .GET) { (response, error) in
            if let data = response {
                let facilityList = getFacilitiesFrom(data: data)
                callback(facilityList, nil)
            } else {
                callback(nil, error)
            }
        }
    }
    
    private static func getFacilitiesFrom(data: [String: Any]) -> [Facility] {
        var facilities = [Facility]()
        if let facilityInfo = data["facilities"] as? [[String: Any]] {
            for facility in facilityInfo {
                print(facility)
                facilities.append(Facility(info: facility))
            }
        }
        return facilities
    }
}
