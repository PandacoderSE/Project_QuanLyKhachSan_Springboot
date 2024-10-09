package com.javaweb.repository.custom;

import com.javaweb.entity.CustomerEntity;

import java.util.List;
import java.util.Map;
import java.util.Objects;

public interface CustomerRepositoryCustom {
    List<CustomerEntity> findAll(Map<String, Object> params) ;
}
