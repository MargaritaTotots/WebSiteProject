package org.spring.springsecurityapp.service;

import org.spring.springsecurityapp.repository.CarRepository;
import org.spring.springsecurityapp.model.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceImpl implements CarService{

    @Autowired
    private CarRepository carRepository;

    @Override
    public void addCar(Car car) {
        carRepository.saveAndFlush(car);
    }

    @Override
    public void updateCar(Car car) {
       // Car carUpdate = carRepository.findCarById(car.getId());
        carRepository.save(car);
    }

    @Override
    public void removeCar(long id) {
        carRepository.delete(id);
    }

    @Override
    public Car getCarById(long id) {
        return carRepository.findCarById(id);
    }

    @Override
    //@Transactional
    public List<Car> listCars() {
        return this.carRepository.findAll();
    }
}


