package com.javaweb.repository.custom.impl;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.repository.custom.TransactionRepositoryCustom;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
@Primary
public class TransactionRepositoryCustomImpl implements TransactionRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager ;
    @Override
    public List<TransactionEntity> findbyCustomerId(Long customerid) {
        String sql = "SELECT * FROM transaction WHERE customerid = " + customerid ;
        Query query = entityManager.createNativeQuery(sql, TransactionEntity.class) ;
        return query.getResultList();
    }
}
