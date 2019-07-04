package org.spring.springsecurityapp.controller;

/*import com.sun.org.apache.xpath.internal.operations.Mod;*/
import javax.servlet.ServletContext;

import org.spring.springsecurityapp.model.Car;
import org.spring.springsecurityapp.service.CarService;
import org.spring.springsecurityapp.service.SecurityService;
import org.spring.springsecurityapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@Controller(value = "/cars")
public class CarController {

    @Autowired
    ServletContext context;

    @Autowired
    private CarService carService;
    private UserService userService;
    private SecurityService securityService;
    private List<Car> cart = new ArrayList<Car>();
    private List<Car> carList ;
    private List<Car> carListsort;
    private List<Car> carRequest;
    private List<String> marks;
    private List<String> fullnesses;
    private List<String> transmissions;

    public void Loading() {
        carList = carService.listCars();
        carRequest = new ArrayList<>();
        marks = new ArrayList<>();
        fullnesses = new ArrayList<>();
        transmissions = new ArrayList<>();
        for (Car car:carList) {if (!marks.contains(car.getCarMarka())) marks.add(car.getCarMarka());}
        for (Car car:carList) {if (!fullnesses.contains(car.getCarFullness())) fullnesses.add(car.getCarFullness());}
        for (Car car:carList) {if (!transmissions.contains(car.getCarTransmission())) transmissions.add(car.getCarTransmission());}
    }

    public void SaveFile(MultipartFile file) throws IOException {
        String uploadedPath = "E:/Java_Programs/Spring/SpringSecurity/SpringSecurityApp-master/SpringSecurityApp-master/src/main/webapp/resources/images";
        byte[] bytes = file.getBytes();
        Path path = Paths.get(uploadedPath + File.separator + file.getOriginalFilename());
        Files.write(path, bytes);
    }


    @RequestMapping(value = {"/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        Loading();
        model.addAttribute("car", new Car());
        model.addAttribute("listCars", this.carService.listCars());
        model.addAttribute("marks",marks);
        model.addAttribute("fullnesses", fullnesses);
        model.addAttribute("transmissions",transmissions);
        return "welcome";
    }


    @RequestMapping(value = {"cars"}, method = RequestMethod.GET)
    public String listCars(Model model){
        //cart = new ArrayList<Car>();
        carList = carService.listCars();
        model.addAttribute("car", new Car());
        model.addAttribute("listCars",carService.listCars());
        return "cars";
    }

    @RequestMapping(value = {"/carscommon"}, method = RequestMethod.GET)
    public String listCarsCommon(Model model){
        Loading();
        carList = carService.listCars();
        model.addAttribute("car", new Car());
        model.addAttribute("listCars",carList);
        model.addAttribute("marks",marks);
        model.addAttribute("fullnesses", fullnesses);
        model.addAttribute("transmissions",transmissions);
        return "carscommon";
    }

    @RequestMapping(value = {"/welcome/sorted"}, method = RequestMethod.GET)
    public String SortingCars(Model model){
        model.addAttribute("car", new Car());
        model.addAttribute("listCars",carListsort);
        model.addAttribute("marks",marks);
        model.addAttribute("fullnesses", fullnesses);
        model.addAttribute("transmissions",transmissions);
        return "welcome";
    }

    @RequestMapping(value = "/sort", method = RequestMethod.POST)
    public String AllSortCars(@RequestParam("mark") String mark, @RequestParam("fullness") String fullness, @RequestParam("transmission") String transmission, @RequestParam("costFrom") String costFrom,@RequestParam("costTo") String costTo, Model model){
        carListsort = new ArrayList<>();
        Sort(mark,fullness,transmission, costFrom, costTo);
        return "redirect:/welcome/sorted";
    }



    @RequestMapping(value = {"/cart"}, method = RequestMethod.GET)
    public String cart(Model model) {

        model.addAttribute("car", new Car());
        model.addAttribute("listCars", cart);
        return "/cart";
    }

    @RequestMapping(value = "/addCart/{id}")
    public String addCarCart(@PathVariable("id") int id){
        Car car = carService.getCarById(id);
        if ((car != null) && (cart != null)) cart.add(car);
        return "redirect:/welcome";
    }


    @RequestMapping(value = "/cart/removeCar/{id}", method = RequestMethod.GET)
    public String removeCarFromCart(@PathVariable("id") int id) {
        Car carcurrent = new Car();
        for (Car car : carService.listCars()) { if (car.getId() == id) { carcurrent = car;break; } }
        if (carcurrent.getId() != null) {
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getId() == carcurrent.getId()) cart.remove(cart.get(i));
            }
        }
        return "redirect:/cart";
    }


    @RequestMapping(value = "/request/{id}", method = RequestMethod.GET)
    public void RequestInfo(@PathVariable("id") int id, Model model){
        carRequest.add(carList.get(id));
    }


    @RequestMapping(value = "managementCars", method = RequestMethod.GET)
    public String managementCar(Model model){
        Loading();
        model.addAttribute("car", new Car());
        model.addAttribute("listCars", carList);
        model.addAttribute("marks",marks);
        model.addAttribute("fullnesses", fullnesses);
        model.addAttribute("transmissions",transmissions);
        return "managementCars";
    }

    public void SortCost(Car car, String costFrom, String costTo)
    {
        if (!(costFrom.equals("CostFrom")) && !(costTo.equals("CostTo")) && (car.getCarCost() >= Integer.valueOf(costFrom)) && (car.getCarCost() <= Integer.valueOf(costTo))) {
            carListsort.add(car);
        } else if (!(costFrom.equals("CostFrom")) && (costTo.equals("CostTo")) && (car.getCarCost() >= Integer.valueOf(costFrom))) {
            carListsort.add(car);
        }else if ((costFrom.equals("CostFrom")) && !(costTo.equals("CostTo")) && (car.getCarCost() <= Integer.valueOf(costTo))) {
            carListsort.add(car);
        }
        else if ((costFrom.equals("CostFrom")) && (costTo.equals("CostTo"))) carListsort.add(car);
    }

    public void Sort(String mark, String fullness, String transmission, String costFrom, String costTo) {
        for (Car car: carList) {
            if (!mark.equals("Mark") && !fullness.equals("Fullness") && !transmission.equals("Transmission")) {
                if ((car.getCarMarka().equals(mark)) && (car.getCarFullness().equals(fullness)) && (car.getCarTransmission().equals(transmission))) SortCost(car, costFrom,costTo);
            }
            else if (mark.equals("Mark") && !fullness.equals("Fullness") && !transmission.equals("Transmission")){
                if ((car.getCarFullness().equals(fullness)) && (car.getCarTransmission().equals(transmission))) SortCost(car, costFrom,costTo);
            }
            else if (mark.equals("Mark") && fullness.equals("Fullness") && !transmission.equals("Transmission")){
                if ((car.getCarTransmission().equals(transmission))) SortCost(car, costFrom,costTo);
            }
            else if (mark.equals("Mark") && !fullness.equals("Fullness") && transmission.equals("Transmission")){
                if ((car.getCarFullness().equals(fullness))) SortCost(car, costFrom,costTo);
            }
            else if (!mark.equals("Mark") && fullness.equals("Fullness") && !transmission.equals("Transmission")){
                if ((car.getCarMarka().equals(mark)) && (car.getCarTransmission().equals(transmission))) SortCost(car, costFrom,costTo);
            }
            else if (!mark.equals("Mark") && !fullness.equals("Fullness") && transmission.equals("Transmission")){
                if ((car.getCarMarka().equals(mark)) && (car.getCarFullness().equals(fullness))) SortCost(car, costFrom,costTo);
            }
            else  if (!mark.equals("Mark") && fullness.equals("Fullness") && transmission.equals("Transmission")) {
                if ((car.getCarMarka().equals(mark))) SortCost(car, costFrom,costTo);
            }
            else  SortCost(car,costFrom,costTo);
        }
    }

    @RequestMapping(value = "/sortcars", method = RequestMethod.POST)
    public String SortCars(@RequestParam("mark") String mark, @RequestParam("fullness") String fullness, @RequestParam("transmission") String transmission, @RequestParam("costFrom") String costFrom,@RequestParam("costTo") String costTo, Model model){
        carListsort = new ArrayList<>();
        Sort(mark, fullness, transmission, costFrom, costTo);
        model.addAttribute("car", new Car());
        model.addAttribute("listCars",carListsort);
        model.addAttribute("marks",marks);
        model.addAttribute("fullnesses", fullnesses);
        model.addAttribute("transmissions",transmissions);
        return "carscommon";
    }

    @RequestMapping(value = "/sorts", method = RequestMethod.POST)
    public String Sorts(@RequestParam("mark") String mark, @RequestParam("fullness") String fullness, @RequestParam("transmission") String transmission, @RequestParam("costFrom") String costFrom,@RequestParam("costTo") String costTo, Model model){
        carListsort = new ArrayList<>();
        Sort(mark, fullness, transmission, costFrom, costTo);
        return "/managementCars/sorted";
    }

    @RequestMapping(value = {"/managementCars/sorted"}, method = RequestMethod.GET)
    public String SortedCars(Model model){
        //cart = new ArrayList<Car>();
        model.addAttribute("car", new Car());
        model.addAttribute("listCars",carListsort);
        model.addAttribute("marks",marks);
        model.addAttribute("fullnesses", fullnesses);
        model.addAttribute("transmissions",transmissions);
        return "managementCars";
    }


    @RequestMapping(value = "/addcar", method = RequestMethod.POST)
    public String addCar(@RequestParam("filenew") MultipartFile file, Model model,@RequestParam("Mark") String mark,
                         @RequestParam("Number") String number, @RequestParam("Transmission") String transmission,
                         @RequestParam("Fullness") String fullness, @RequestParam("Cost") String cost) throws IOException {
        if (file != null) {
            SaveFile(file);
            Car car = new Car(mark, number, fullness, transmission, Double.valueOf(cost), file.getOriginalFilename());
            this.carService.addCar(car);
        }
        carList = carService.listCars();
        model.addAttribute("car", new Car());
        model.addAttribute("listCars", carList);
        return "managementCars";
    }


    @RequestMapping(value = "/remove/{id}")
    public String removeCar(@PathVariable("id") int id, Model model){
        this.carService.removeCar(id);
        model.addAttribute("car", new Car());
        model.addAttribute("listCars", this.carService.listCars());
        return "redirect:/managementCars";
    }

    @RequestMapping(value = "/edit/{id}")
    public String editCar(@PathVariable("id") int id, Model model){
        model.addAttribute("car", this.carService.getCarById(id));
        model.addAttribute("listCars", this.carService.listCars());

        return "managementCars";
    }

    @RequestMapping(value = "/editsave/{id}", method = RequestMethod.POST)
    public String editSaveCar(@PathVariable("id") int id,@RequestParam("carMark") String mark,
                              @RequestParam("carNumber") String number, @RequestParam("carTransmission") String transmission,
                              @RequestParam("carFullness") String fullness, @RequestParam("carCost") String cost,
                              @RequestParam("file") MultipartFile file, Model model) throws IOException {
        if (file != null) {
            SaveFile(file);
            Car carUpdate = new Car();
            for (Car car: carList) { if(car.getId() == id) {carUpdate = car; break;} }
            carUpdate.setCarMarka(mark);
            carUpdate.setCarNumber(number);
            carUpdate.setCarTransmission(transmission);
            carUpdate.setCarFullness(fullness);
            carUpdate.setCarCost(Double.valueOf(cost));
            carUpdate.setImagePath(file.getOriginalFilename());
            carService.updateCar(carUpdate);
        }
        model.addAttribute("car", new Car());
        model.addAttribute("listCars", this.carService.listCars());
        return "redirect:/managementCars";
    }
}

