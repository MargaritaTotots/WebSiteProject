package org.spring.springsecurityapp.validator;

import org.spring.springsecurityapp.model.User;
import org.spring.springsecurityapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


@Component
public class UserValidator implements Validator {

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "Required");
        if (user.getUsername().length() < 8 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userForm.username");
        }

        if (userService.findByUsername(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Required");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmPassword", "Different.userForm.password");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstname", "Required");
        if (user.getFirstname().length() < 2 || user.getFirstname().length() > 32){
            errors.rejectValue("firstname", "Size.userForm.firstname");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastname", "Required");
        if (user.getLastname().length() < 1 || user.getLastname().length() > 32){
            errors.rejectValue("lastname", "Size.userForm.lastname");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birth", "Required");
        if (user.getBirth() == null){
            errors.rejectValue("birth", "Wrong");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passport", "Required");
        if (user.getPassport().length() < 1 || user.getPassport().length() > 7){
            errors.rejectValue("passport", "Size.userForm.passport");
        }
    }
}
