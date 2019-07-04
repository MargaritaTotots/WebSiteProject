package org.spring.springsecurityapp.model;


import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "rents")
public class Rent {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


    @ManyToOne(optional = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    @JoinColumn(name = "IDuser", nullable = false)
    private User user;

    @ManyToOne(optional = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    @JoinColumn(name = "IDcar", nullable = false)
    private Car car;

    @Column(name = "DateStart")
    private Date dateStart;

    @Column(name = "DateEnd")
    private Date dateEnd;

    @Column(name = "Status")
    private String status;

    @Column(name = "Total")
    private double total;


    public Rent(User user, Car car, Date dateStart, Date dateEnd, String status, double total) {
        this.user = user;
        this.car = car;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.status = status;
        this.total = total;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }


    public Rent() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }



    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotal() { return total; }

    public void setTotal(double total) { this.total = total; }
}
