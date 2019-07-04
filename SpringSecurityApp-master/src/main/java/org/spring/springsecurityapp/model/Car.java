package org.spring.springsecurityapp.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "cars")
public class Car {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    public Car() {
    }

    @Column(name = "Marka")
    private String carMarka;

    @Column(name = "Number")
    private String carNumber;

    @Column(name = "Fullness")
    private String carFullness;

    @Column(name = "Transmission")
    private String carTransmission;

    @Column(name = "Cost")
    private double carCost;

    @Column(name = "ImagePath")
    private String imagePath;

    @OneToMany(fetch = FetchType.EAGER , mappedBy = "car")
    private Set<Rent> rents;

    public Car(String carMarka, String carNumber, String carFullness, String carTransmission, double carCost, String imagePath) {
        this.carMarka = carMarka;
        this.carNumber = carNumber;
        this.carFullness = carFullness;
        this.carTransmission = carTransmission;
        this.carCost = carCost;
        this.imagePath = imagePath;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", carMarka='" + carMarka + '\'' +
                ", carNumber='" + carNumber + '\'' +
                ", carFullness='" + carFullness + '\'' +
                ", carTransmission='" + carTransmission + '\'' +
                ", carCost=" + carCost +
                '}';
    }

    public String getCarMarka() {
        return carMarka;
    }

    public void setCarMarka(String carMarka) {
        this.carMarka = carMarka;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }

    public String getCarFullness() {
        return carFullness;
    }

    public void setCarFullness(String carFullness) {
        this.carFullness = carFullness;
    }

    public String getCarTransmission() {
        return carTransmission;
    }

    public void setCarTransmission(String carTransmission) {
        this.carTransmission = carTransmission;
    }

    public double getCarCost() {
        return carCost;
    }

    public void setCarCost(double carCost) {
        this.carCost = carCost;
    }

    public String getImagePath() { return imagePath; }

    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

}
