package org.spring.springsecurityapp.repository;

import org.spring.springsecurityapp.model.Rent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RentRepository extends JpaRepository<Rent, Long > {

    @Query("select r from Rent r where r.id = :id")
    Rent findRentById(@Param("id") long id);
}
