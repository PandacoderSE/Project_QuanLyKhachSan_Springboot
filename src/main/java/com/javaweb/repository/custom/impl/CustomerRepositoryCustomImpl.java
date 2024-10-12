package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import com.javaweb.utils.NumberUtils;
import com.javaweb.utils.StringUtils;
import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Repository
@Primary
@Transactional
public class CustomerRepositoryCustomImpl  implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager ;
    //join table
    public static void joinTable(Map<String,Object> params, StringBuilder sql) {
        String staffid =  String.valueOf(params.get("managementStaff"));
        //String staffid = (String) params.get("managementStaff");
        if (StringUtils.check(staffid) && (staffid != "null")) {
            sql.append(" INNER JOIN  assignmentcustomer ON customer.id = assignmentcustomer.customerid ");
        }

    }
    // query đk
    public static void queryNormal(Map<String,Object> params,StringBuilder where) {
        for(Map.Entry<String, Object> it : params.entrySet()) {
            if(!it.getKey().equals("managementStaff") && !it.getKey().startsWith("d")) {
                String value = it.getValue().toString() ;
                if(StringUtils.check(value)) {
                    if(NumberUtils.isLong(value)) {
                        where.append(" AND customer."+it.getKey() + " = " +value) ;
                    }else {
                        where.append(" AND customer."+it.getKey() + " LIKE '%" +value +"%' ") ;
                    }
                }
            }
        }
    }
    // truy vấn phức tạp
    public static void querySpecial(Map<String,Object> params, StringBuilder where) {
        //staffid
        //String staffid = (String) params.get("managementStaff");
        String staffid =  String.valueOf(params.get("managementStaff"));
       //String staffid =  String.valueOf(params.get("managementStaff"));
        if (StringUtils.check(staffid) && (staffid != "null")) {
            where.append(" AND  assignmentcustomer.staffid = " + staffid);
        }
    }

    @Override
    public List<CustomerEntity> findAll(Map<String, Object> params, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT customer.* FROM customer ") ;
        joinTable(params,sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ") ;
        queryNormal(params,where);
        querySpecial(params,where);
        where.append(" GROUP BY customer.id ") ;
        sql.append(where) ;
        sql.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class) ;
        return query.getResultList();
    }


    @Override
    public int countTotalItem(Map<String, Object> params) {
        StringBuilder sql = new StringBuilder("SELECT customer.* FROM customer ") ;
        joinTable(params,sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ") ;
        queryNormal(params,where);
        querySpecial(params,where);
        where.append(" GROUP BY customer.id ") ;
        sql.append(where) ;
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class) ;
        return query.getResultList().size();
    }

    @Override
    public void insert(Long staffid, Long customerid) {
        String sql = "INSERT INTO assignmentcustomer (staffid, customerid) VALUES("+ staffid +","+customerid+")";
        Query query = entityManager.createNativeQuery(sql);
        query.executeUpdate();
    }
}
