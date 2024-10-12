package com.javaweb.repository.custom;

import com.javaweb.entity.TransactionEntity;

import java.util.List;

public interface TransactionRepositoryCustom {
    List<TransactionEntity> findbyCustomerId(Long customerid, Long st) ;
}
