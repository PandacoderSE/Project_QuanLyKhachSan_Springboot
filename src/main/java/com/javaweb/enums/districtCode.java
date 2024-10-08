package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum  districtCode {
    QUAN_1 ("Quận 1"),
    QUAN_2 ("Quận 2"),
    QUAN_3 ("Quận 3"),
    QUAN_4 ("Quận 4"),
    QUAN_5 ("Quận 5"),
    QUAN_6 ("Quận 6"),
    QUAN_7 ("Quận 7"),
    QUAN_8 ("Quận 8") ;

    private final String districtName;
    // xây dựng constractor
    districtCode(String districtName) {
        this.districtName = districtName;
    }

    public String getDistrictName() {
        return districtName;
    }
 // lưu dữ liệu vô hashMap để đem đi dùng
    public static Map<String,String> type(){
        Map<String,String> listType = new HashMap<>();
        for(districtCode item : districtCode.values()){
            listType.put(item.toString() , item.districtName);
        }
        return listType;
    }
}
