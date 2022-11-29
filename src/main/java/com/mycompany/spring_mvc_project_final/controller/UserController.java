/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.RoomCategoryEntity;
import com.mycompany.spring_mvc_project_final.service.RoomCateService;
import com.mycompany.spring_mvc_project_final.service.RoomService;
import com.mycompany.spring_mvc_project_final.utils.DateUtil;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private RoomCateService roomCateService;
    
    @Autowired
    private RoomService roomService;
    
    @RequestMapping(value = {"/","/home-user"},method = RequestMethod.GET)
    public String viewHome(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        
        model.addAttribute("roomcate", roomCateService.getRoomCates());
        
        model.addAttribute("message", "Hello User: " + username);
        return "home";
    }
    
    @RequestMapping("/viewRoomDetail/{id}")
    public String viewRoomDetail(Model model, @PathVariable("id") long id){
        
        RoomCategoryEntity roomcate =  roomCateService.findRoomCateById(id);
        model.addAttribute("roomcate", roomcate);
        
        return "user/user-viewRoomDetail";
    }
    @RequestMapping("/about-us")
    public String viewAboutUS(Model model){
        return "user/user-AboutUS";
    }
    
    @RequestMapping("/gallery")
    public String viewGallery(Model model){
        return "user/user-gallery";
    }
    @RequestMapping("/contact")
    public String viewContact(){
        return "user/user-contact";
    }
    @RequestMapping("/blog")
    public String viewBlog(){
        return "user/user-Blog";
    }
    
    
    
    @RequestMapping("/room-accomodation")
    public String roomAccomodation(Model model){
        
        model.addAttribute("room", roomService.getRooms());
        
//        System.out.println("room ******************: " +roomService.getRooms());
        
        return "user/user-accomodation";
    }
    
    
//    @RequestMapping("/banner")
//    public String banner(Model model){
//        
//        model.addAttribute("roomtype", roomCateService.getRoomCates());
//        System.out.println("asdakjshdasdhkashd: " + roomCateService.getRoomCates());
//        return "include/user/user-banner";
//    }
    
    
   
    
    // Funtion - Search room
    @RequestMapping(value = "/search-room", method = RequestMethod.POST)
    public String searchRoom(Model model, HttpSession session,
            @RequestParam(value = "nameroom", required = true) String nameRoom,
            @RequestParam(value = "searchCheckIn", required = true) String searchCheckIn,
            @RequestParam(value = "searchCheckOut", required = true) String searchCheckOut) {

        model.addAttribute("roomcate", roomCateService.getRoomCates());

//        model.addAttribute("room", roomCateService.searchRoom(nameRoom, convertStringToDate(searchCheckIn),
//                convertStringToDate(searchCheckOut)));
        
        model.addAttribute("room", roomCateService.searchRoom(nameRoom, DateUtil.converStringToDate(searchCheckIn),
                DateUtil.converStringToDate(searchCheckOut)));
        
        
        System.out.println("akjsdhajshdkhaskjdhajkshdashd: " + roomCateService.searchRoom(nameRoom, DateUtil.converStringToDate(searchCheckIn),
                DateUtil.converStringToDate(searchCheckOut)));
        
        session.setAttribute("checkIn", DateUtil.converStringToDate(searchCheckIn));
        session.setAttribute("checkOut", DateUtil.converStringToDate(searchCheckOut));

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        session.setAttribute("bookingdate", DateUtil.converStringToDate(formatter.format(date)));
        System.out.println("Bookingdate *************" + formatter.format(date));

//        session.setAttribute("bookingdate", java.time.LocalDate.now());
//        System.out.println("***********************" + roomCateService.searchRoom(nameRoom, convertStringToDate(searchCheckIn), convertStringToDate(searchCheckOut)));
        return "user/user-accomodation";
    }
}
