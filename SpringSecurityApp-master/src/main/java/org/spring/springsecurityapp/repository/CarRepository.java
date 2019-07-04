package org.spring.springsecurityapp.repository;

import org.spring.springsecurityapp.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CarRepository extends JpaRepository<Car, Long> {

    @Query("select c from Car c where c.id = :id")
    Car findCarById(@Param("id") long id);
}
