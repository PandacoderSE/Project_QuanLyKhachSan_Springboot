package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.buildingType;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.utils.NumberUtils;
import com.javaweb.utils.StringUtils;
import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
@Primary
public class BuildingRepositoryimpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager ;
    public static void joinTable(Map<String,Object> params,List<String> typecode, StringBuilder sql) {
        String saffid = (String) params.get("staffId");
        if (StringUtils.check(saffid)) {
            sql.append(" INNER JOIN  assignmentbuilding ON building.id = assignmentbuilding.buildingid ");
        }

    }
    // truy vấn cơ bản số = , sâu like
    public static void queryNormal(Map<String,Object> params,StringBuilder where) {
        for(Map.Entry<String, Object> it : params.entrySet()) {
            if(!it.getKey().equals("staffId") && !it.getKey().equals("typeCode")
                    && !it.getKey().startsWith("area")&& !it.getKey().startsWith("rentPrice") && !it.getKey().startsWith("d")) {
                String value = it.getValue().toString() ;
                if(StringUtils.check(value)) {
                    if(NumberUtils.isLong(value)) {
                        where.append(" AND building."+it.getKey() + " = " +value) ;
                    }else {
                        where.append(" AND building."+it.getKey() + " LIKE '%" +value +"%' ") ;
                    }
                }
            }
        }
    }
    // truy vấn phức tạp
    public static void querySpecial(Map<String,Object> params,List<String> typecode,StringBuilder where) {
        //staffid
        String staffid = (String) params.get("staffId");
        if (StringUtils.check(staffid)) {
            where.append(" AND  assignmentbuilding.staffid = " + staffid);
        }
        //rentArea
        String rentAreaTo = (String) params.get("areaTo");
        String rentAreaFrom = (String) params.get("areaFrom");
        if (StringUtils.check(rentAreaTo) || StringUtils.check(rentAreaFrom)) {
            where.append(" AND EXISTS (SELECT * FROM rentarea r WHERE  building.id = r.buildingid");
            if (StringUtils.check(rentAreaFrom)) {
                where.append(" AND r.value >=" + rentAreaFrom);
            }
            if (StringUtils.check(rentAreaTo)) {
                where.append(" AND r.value <=" + rentAreaTo);
            }
            where.append(" ) ");
        }
        // rentprice
        String rentPriceTo = (String) params.get("rentPriceTo");
        String rentPriceFrom = (String) params.get("rentPriceFrom");
        if (StringUtils.check(rentPriceFrom) || StringUtils.check(rentPriceTo)) {
            if (StringUtils.check(rentPriceFrom)) {
                where.append(" AND building.rentprice >=" + rentPriceFrom);
            }
            if (StringUtils.check(rentAreaTo)) {
                where.append(" AND building.rentprice <=" + rentPriceTo);
            }
        }
        //typecode
//		if(typecode !=null && typecode.size()!=0) {
//			// dùng string.join
//			where.append(" AND renttype.code IN('" +String.join("','",typecode) +"')") ;
//		}
        //cách 2 : luôn có dấu cách
        if (typecode != null && typecode.size() != 0) {

            where.append(" AND (");
            String sql = typecode.stream().map(it -> "building.type Like" + "'%" + it + "%' ").collect(Collectors.joining(" OR "));
            where.append(sql);
            where.append(" ) ");
        }
    }

    @Override
    public List<BuildingEntity> findAll(Map<String, Object> params, List<String> typeCode, Pageable pageable) {
        StringBuilder sql =new StringBuilder("SELECT building.* FROM building ");
        joinTable(params, typeCode, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ") ;
        queryNormal(params, where);
        querySpecial(params, typeCode, where);
        where.append(" GROUP BY building.id ") ;
        sql.append(where) ;
        sql.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset()); ;
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

    @Override
    public List<UserEntity> findByBuildingID(Long BuildingID) {
        return  null ;
    }


    // xay dựng hàm tính tổng số lượng building
    @Override
    public int countTotalItem(Map<String, Object> params, List<String> typeCode) {
        StringBuilder sql =new StringBuilder("SELECT building.* FROM building ");
        joinTable(params, typeCode, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ") ;
        queryNormal(params, where);
        querySpecial(params, typeCode, where);
        where.append(" GROUP BY building.id ;") ;
        sql.append(where) ;
        Query query = entityManager.createNativeQuery(sql.toString(),BuildingEntity.class) ;
        return query.getResultList().size();
    }

}
