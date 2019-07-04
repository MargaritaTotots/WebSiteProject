package org.spring.springsecurityapp.controller;

import org.spring.springsecurityapp.model.Car;
import org.spring.springsecurityapp.model.User;
import org.spring.springsecurityapp.service.CarService;
import org.spring.springsecurityapp.service.RentService;
import org.spring.springsecurityapp.service.SecurityService;
import org.spring.springsecurityapp.service.UserService;
import org.spring.springsecurityapp.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;


@Controller()
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private CarService carService;

    @Autowired
    private RentService rentService;



    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);
        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());
        List<Car> carList = carService.listCars();
        List<Car>carRequest = new ArrayList<>();
        List<String>marks = new ArrayList<>();
        List<String>fullnesses = new ArrayList<>();
        List<String>transmissions = new ArrayList<>();
        for (Car car:carList) {if (!marks.contains(car.getCarMarka())) marks.add(car.getCarMarka());}
        for (Car car:carList) {if (!fullnesses.contains(car.getCarFullness())) fullnesses.add(car.getCarFullness());}
        for (Car car:carList) {if (!transmissions.contains(car.getCarTransmission())) transmissions.add(car.getCarTransmission());}
        model.addAttribute("car", new Car());
        model.addAttribute("listCars", this.carService.listCars());
        model.addAttribute("marks",marks);
        model.addAttribute("fullnesses", fullnesses);
        model.addAttribute("transmissions",transmissions);
        return "/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect.");
        }

        if (logout != null) {
            model.addAttribute("message", "Logged out successfully.");
        }

        return "login";
    }


    @RequestMapping(value = "/accessdenied", method = RequestMethod.GET)
    public String accessdenied(Model model) {
        return "accessdenied";
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String error(Model model) {
        return "error";
    }

    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
            model.addAttribute("listCars", this.carService.listCars());
            return "admin";
    }


}
