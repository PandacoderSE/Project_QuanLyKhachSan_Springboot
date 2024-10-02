package com.javaweb.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "rentarea")
public class RentAreaEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id ;

    @Column(name = "value")
    private Long value;
    @ManyToOne
    @JoinColumn(name = "buildingid")
    private BuildingEntity buildingEntity;

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public Long getValue() {
        return value;
    }

    public void setValue(Long value) {
        this.value = value;
    }

    public BuildingEntity getBuildingEntity() {
        return buildingEntity;
    }

    public void setBuildingEntity(BuildingEntity buildingEntity) {
        this.buildingEntity = buildingEntity;
    }

    @Override
    public String toString() {
        return  value.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RentAreaEntity rentArea = (RentAreaEntity) o;
        return Objects.equals(Id, rentArea.Id) && Objects.equals(value, rentArea.value) && Objects.equals(buildingEntity, rentArea.buildingEntity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(Id, value, buildingEntity);
    }
}
