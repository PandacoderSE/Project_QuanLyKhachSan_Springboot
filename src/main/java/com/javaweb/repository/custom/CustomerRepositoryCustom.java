package com.javaweb.repository.custom;

import com.javaweb.entity.CustomerEntity;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;
import java.util.Objects;

public interface CustomerRepositoryCustom {
    List<CustomerEntity> findAll(Map<String, Object> params, Pageable pageable) ;
    int countTotalItem(Map<String, Object> params);
}
