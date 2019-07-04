package org.spring.springsecurityapp.controller;

import org.spring.springsecurityapp.model.Car;
import org.spring.springsecurityapp.model.Rent;
import org.spring.springsecurityapp.model.User;
import org.spring.springsecurityapp.service.CarService;
import org.spring.springsecurityapp.service.RentService;
import org.spring.springsecurityapp.service.UserService;
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;



@Controller(value = "/rent")
public class RentController {

    @Autowired
    private RentService rentService;
    @Autowired
    private UserService userService;
    @Autowired
    private CarService carService;


    private List<Rent>  historyrent;
    private User currentuser;
    private Car chosencar;


    @RequestMapping(value = {"/rent"}, method = RequestMethod.GET)
    public String rent(Model model) {

        model.addAttribute("rent", new Rent());
        model.addAttribute("listRents", this.rentService.listRents());
        return "rent";
    }

    @RequestMapping(value = {"/rentedit/{id}"}, method = RequestMethod.GET)
    public String rentEdit(@PathVariable("id") int id, Model model) {

        model.addAttribute("rent", rentService.getRentById(id));
        model.addAttribute("listRents", rentService.listRents());
        return "rent";
    }

    @RequestMapping(value = {"/renteditsave/{id}"}, method = RequestMethod.POST)
    public String rentEditSave(@PathVariable("id") int id, @RequestParam("dateStart") Date dateStart, @RequestParam("dateEnd") Date dateEnd, @RequestParam("Status") String status, Model model) {

        Rent rentUpdated = new Rent();
        for (Rent rent:rentService.listRents()) {if (rent.getId() == id) {rentUpdated = rent; break;} }
        rentUpdated.setDateStart(dateStart);
        rentUpdated.setDateEnd(dateEnd);
        rentUpdated.setStatus(status);
        rentService.updateRent(rentUpdated);
        model.addAttribute("rent", new Rent());
        model.addAttribute("listRents", rentService.listRents());
        return "rent";
    }

    @RequestMapping(value = "/rentremove/{id}")
    public String removeCar(@PathVariable("id") int id, Model model){
        rentService.removeRent(id);
        model.addAttribute("rent", new Rent());
        model.addAttribute("listRents", rentService.listRents());
        return "rent";
    }

    @RequestMapping(value = "/cart/rentInfo/{id}", method = RequestMethod.GET)
    public String rentInfo(@PathVariable("id") int id, Model model){
        Car carcurrent = new Car();
        for (Car car: carService.listCars()) { if (car.getId() == id) {carcurrent = car; break;}}
        chosencar = carcurrent;
        return "/rentInfo";
    }


    @RequestMapping(value = "/confirmrentinfo/{username}", method = RequestMethod.POST)
    public String confirmRent(@PathVariable("username") String username, @RequestParam("dateStart") Date dateStart, @RequestParam("dateEnd") Date dateEnd, Model model){
        int days = Days.daysBetween(new DateTime(dateStart), new DateTime(dateEnd)).getDays();

            currentuser = userService.findByUsername(username);
            Rent newrent = new Rent(currentuser, chosencar, dateStart, dateEnd, "Request", days * chosencar.getCarCost());
            rentService.addRent(newrent);
            List<Car> carList = carService.listCars();
            List<String> marks = new ArrayList<>();
            List<String> fullnesses = new ArrayList<>();
            List<String> transmissions = new ArrayList<>();
            for (Car car : carList) {
                if (!marks.contains(car.getCarMarka())) marks.add(car.getCarMarka());
            }
            for (Car car : carList) {
                if (!fullnesses.contains(car.getCarFullness())) fullnesses.add(car.getCarFullness());
            }
            for (Car car : carList) {
                if (!transmissions.contains(car.getCarTransmission())) transmissions.add(car.getCarTransmission());
            }
            model.addAttribute("car", new Car());
            model.addAttribute("listCars", this.carService.listCars());
            model.addAttribute("marks", marks);
            model.addAttribute("fullnesses", fullnesses);
            model.addAttribute("transmissions", transmissions);
            return "/welcome";
    }

    @RequestMapping(value = "/history/{username}")
    public String historyRent(@PathVariable("username") String username, Model model){
        currentuser = userService.findByUsername(username);
        historyrent = new ArrayList<>();
        for (Rent rent:rentService.listRents()) { if (rent.getUser().getId() == currentuser.getId()) historyrent.add(rent); }
        model.addAttribute("listRents", historyrent);
        return "history";
    }

    @RequestMapping(value = "/historyrent/{id}")
    public String rentCar(@PathVariable("id") int id, Model model){
        Rent newrent = new Rent();
        for (Rent rent:rentService.listRents()) { if (rent.getId() == id) {newrent = rent; break;} }
        newrent.setStatus("Rent");
        rentService.updateRent(newrent);
        historyrent = new ArrayList<>();
        for (Rent rent:rentService.listRents()) { if (rent.getUser().getId() == currentuser.getId()) historyrent.add(rent); }
        model.addAttribute("listRents", historyrent);
        return "history";
    }

    @RequestMapping(value = "/historyreturn/{id}")
    public String returnCar(@PathVariable("id") int id, Model model){
        Rent newrent = new Rent();
        for (Rent rent:rentService.listRents()) { if (rent.getId() == id) {newrent = rent; break;} }
        newrent.setStatus("Returned");
        rentService.updateRent(newrent);
        historyrent = new ArrayList<>();
        for (Rent rent:rentService.listRents()) { if (rent.getUser().getId() == currentuser.getId()) historyrent.add(rent); }
        model.addAttribute("listRents", historyrent);
        return "history";
    }



    @RequestMapping(value = {"/rent/addrent"}, method = RequestMethod.GET)
    public String addRent(Model model) {

        model.addAttribute("rent", new Rent());
        model.addAttribute("listRents", this.rentService.listRents());
        return "rent";
    }

    @RequestMapping(value = {"/rent/confirm"})
    public String rentConfirm(Model model) {
        model.addAttribute("rent", new Rent());
        model.addAttribute("listRents", this.rentService.listRents());
        return "rent";
    }


    @RequestMapping(value = "/rent/rentInfo")
    public String rentInfo(){
        return "redirect:/rent/confirm";
    }


}

