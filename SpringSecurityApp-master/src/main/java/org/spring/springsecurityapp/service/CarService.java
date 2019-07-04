package org.spring.springsecurityapp.service;

import org.spring.springsecurityapp.model.Car;

import java.util.List;

public interface CarService {
   void addCar(Car car);

   void updateCar(Car car);

   void removeCar(long id);

   Car getCarById(long id);

  List<Car> listCars();
}




