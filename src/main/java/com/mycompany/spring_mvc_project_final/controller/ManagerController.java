/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.GuestEntity;
import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomCategoryEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingRoom;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatus;
import com.mycompany.spring_mvc_project_final.enums.CommonStatus;
import com.mycompany.spring_mvc_project_final.enums.Gender;
import com.mycompany.spring_mvc_project_final.repository.ServiceBookingRoomRepository;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.GuestService;
import com.mycompany.spring_mvc_project_final.service.ImageService;
import com.mycompany.spring_mvc_project_final.service.PromotionService;
import com.mycompany.spring_mvc_project_final.service.RoomCateService;
import com.mycompany.spring_mvc_project_final.service.RoomService;
import com.mycompany.spring_mvc_project_final.service.ServiceBookingRoomService;
import com.mycompany.spring_mvc_project_final.service.ServiceService;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author LENOVO
 */
@Controller
@RequestMapping("/management")
public class ManagerController {

    @Autowired
    private RoomCateService roomCateService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private ServiceBookingRoomRepository serviceBookingRoomRepository;

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private ServiceBookingRoomService serviceBookingRoomService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private GuestService guestService;

    @RequestMapping("/home-manager")
    public String viewHome(Model model) {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }

        model.addAttribute("message", "Hello Manager: " + username);
        model.addAttribute("username", username);
        return "management/home-manager";
    }

//    --------ROOM MANAGEMENT--------
    @RequestMapping("/add-room")
    public String addRoom(Model model) {
        model.addAttribute("room", new RoomEntity());

        List<String> categories = new ArrayList<>();
        for (RoomCategoryEntity rc : roomCateService.getRoomCates()) {
            categories.add(rc.getName());
        }
        model.addAttribute("categories", categories);
        model.addAttribute("status", CommonStatus.values());
        model.addAttribute("action", "add");
        return "management/add-room";
    }

    @RequestMapping(value = "/done-add-room", method = RequestMethod.POST)
    public String doneAddRoom(Model model,
            @Valid @ModelAttribute("room") RoomEntity room, BindingResult result,
            @RequestParam("roomCategory") String inputValue) {
        if (result.hasErrors()) {
            model.addAttribute("action", "update");
            model.addAttribute("room", room);
            List<String> categories = new ArrayList<>();
            for (RoomCategoryEntity rc : roomCateService.getRoomCates()) {
                categories.add(rc.getName());
            }
            model.addAttribute("categories", categories);
            model.addAttribute("status", CommonStatus.values());
            System.out.println(result);
            return "/management/add-room";
        }
        RoomCategoryEntity roomCategory = roomCateService.findCategoryByName(inputValue);
        room.setRoomCategoryEntity(roomCategory);
        roomCategory.getRoomEntitys().add(room);

        roomService.save(room);
        return "redirect:/management/view-rooms";
    }

    @RequestMapping(value = "/view-rooms", method = RequestMethod.GET)
    public String viewRoom(Model model,
            @RequestParam(name = "message", required = false) String message,
            @RequestParam(name = "messageType", required = false) String messageType) {
        model.addAttribute("message", message);
        model.addAttribute("messageType", messageType);
        model.addAttribute("rooms", roomService.getRooms());
        return "management/view-rooms";
    }

    @RequestMapping("/update-room/{id}")
    public String updateRoom(Model model,
            @PathVariable("id") long id) {
        RoomEntity room = roomService.findRoomById(id);
        if (room.getId() > 0) {
            model.addAttribute("action", "update");
        } else {
            model.addAttribute("action", "add");
        }
        model.addAttribute("room", room);
        List<String> categories = new ArrayList<>();
        for (RoomCategoryEntity rc : roomCateService.getRoomCates()) {
            categories.add(rc.getName());
        }
        model.addAttribute("categories", categories);
        model.addAttribute("status", CommonStatus.values());
        return "management/add-room";
    }

    @RequestMapping("/delete-room/{id}")
    public String deleteRoom(Model model,
            @PathVariable("id") long id) {
        if (!roomService.deleteRoom(id)) {
            return "redirect:/management/view-rooms?message=Delete room success&messageType=success";
        } else {
            model.addAttribute("message", "Delete fail! There is at least one booking that booked this room");
            model.addAttribute("messageType", "fail");
            model.addAttribute("rooms", roomService.getRooms());
            return "redirect:/management/view-rooms";
        }
    }

//    --------ROOM CATEGORY MANAGEMENT--------    
    @RequestMapping("/add-room-category")
    public String addRoomCategory(Model model) {
        model.addAttribute("roomCategory", new RoomCategoryEntity());
        model.addAttribute("action", "add");
        model.addAttribute("status", CommonStatus.values());
        return "management/add-room-category";
    }

    @RequestMapping("/update-room-category/{id}")
    public String updateRoomCategory(Model model, HttpSession session,
            @PathVariable("id") long id) {
        RoomCategoryEntity roomCate = roomCateService.findRoomCateById(id);
        session.setAttribute("id", id);
        model.addAttribute("roomCategory", roomCate);
        model.addAttribute("images", roomCate.getImageEntitys());
        model.addAttribute("status", CommonStatus.values());
        return "management/update-room-category";
    }

    @RequestMapping(value = "/done-update-room-category", method = RequestMethod.POST)
    public String doneUpdateRoomCategory(Model model, HttpSession session,
            @Valid @ModelAttribute("roomCategory") RoomCategoryEntity roomCategory, BindingResult result,
            @RequestParam(name = "files", required = false) MultipartFile[] files) {
        Long id = Long.parseLong(session.getAttribute("id").toString());
        if (result.hasErrors()) {
            model.addAttribute("action", "update");
            model.addAttribute("roomCategory", roomCategory);
            model.addAttribute("status", CommonStatus.values());
            System.out.println(result);
            return "/management/add-room-category";
        }
        if (!imageService.isValid(files)) {
            model.addAttribute("roomCategory", roomCategory);
            model.addAttribute("action", "update");
            model.addAttribute("status", CommonStatus.values());
            model.addAttribute("result", "error");
            return "management/add-room-category";
        }

        String uploadRootPath = "D:\\DoAn\\Spring_MVC_Project_Final\\src\\main\\webapp\\resources\\image\\image-roomcategory";
        File uploadRootDir = new File(uploadRootPath);

        if (!uploadRootDir.exists()) {
            uploadRootDir.mkdirs();
        }

        RoomCategoryEntity roomCate = roomCateService.findRoomCateById(id);
        List<ImageEntity> images = roomCate.getImageEntitys();

        if (files.length > 0) {
            List<File> uploadedFiles = new ArrayList<File>();
            for (MultipartFile fileData : files) {
                String name = fileData.getOriginalFilename();

                System.out.println("Client File Name = " + name);
                if (name != null && name.length() > 0) {
                    try {
                        File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);

                        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                        stream.write(fileData.getBytes());
                        stream.close();
                        uploadedFiles.add(serverFile);

                        ImageEntity img = new ImageEntity();
                        img.setName(name);
                        images.add(img);
                        img.setRoomCategoryEntity(roomCate);

                        System.out.println("Write file: " + serverFile);
                    } catch (Exception e) {
                        System.out.println("Error Write file: " + name);
                    }
                }
            }
        }

        roomCate.setArea(roomCategory.getArea());
        roomCate.setCapacity(roomCategory.getCapacity());
        roomCate.setDescription(roomCategory.getDescription());
        roomCate.setName(roomCategory.getName());
        roomCate.setNumberOfBed(roomCategory.getNumberOfBed());
        roomCate.setPrice(roomCategory.getPrice());
//        roomCate.setStatus(roomCategory.getStatus());
        roomCate.setImageEntitys(images);
        roomCateService.save(roomCate);
        return "redirect:/management/view-room-categories";
    }

    @RequestMapping(value = "/done-add-room-category", method = RequestMethod.POST)
    public String doneAddRoomCategory(HttpServletRequest servletRequest, Model model,
            @Valid @ModelAttribute("roomCategory") RoomCategoryEntity roomCategory, BindingResult result,
            @RequestParam(name = "files", required = false) MultipartFile[] files) {
        if (result.hasErrors()) {
            model.addAttribute("action", "add");
            model.addAttribute("roomCategory", roomCategory);
            model.addAttribute("status", CommonStatus.values());
            System.out.println(result);
            return "/management/add-room-category";
        }
        if (!imageService.isValid(files)) {
            model.addAttribute("roomCategory", roomCategory);
            model.addAttribute("action", "add");
            model.addAttribute("status", CommonStatus.values());
            model.addAttribute("result", "error");
            return "management/add-room-category";
        }
        String uploadRootPath = "D:\\DoAn\\Spring_MVC_Project_Final\\src\\main\\webapp\\resources\\image\\image-roomcategory";
        File uploadRootDir = new File(uploadRootPath);

        if (!uploadRootDir.exists()) {
            uploadRootDir.mkdirs();
        }

        List<ImageEntity> images = new ArrayList<>();
        if (files.length > 0) {

            List<File> uploadedFiles = new ArrayList<File>();
            for (MultipartFile fileData : files) {
                String name = fileData.getOriginalFilename();

                System.out.println("Client File Name = " + name);

                if (name != null && name.length() > 0) {
                    try {
                        File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);

                        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                        stream.write(fileData.getBytes());
                        stream.close();

                        uploadedFiles.add(serverFile);
                        ImageEntity img = new ImageEntity();
                        img.setName(name);
                        images.add(img);
                        img.setRoomCategoryEntity(roomCategory);
                       
                        System.out.println("Write file: " + serverFile);
                    } catch (Exception e) {
                        System.out.println("Error Write file: " + name);
                    }
                }
                roomCategory.setImageEntitys(images);
            }
        }
        roomCateService.save(roomCategory);
        return "redirect:/management/view-room-categories";
    }

    @RequestMapping(value = "/view-room-categories", method = RequestMethod.GET)
    public String viewRoomCategories(Model model,
            @RequestParam(name = "message", required = false) String message,
            @RequestParam(name = "messageType", required = false) String messageType) {
        model.addAttribute("message", message);
        model.addAttribute("messageType", messageType);
        model.addAttribute("roomCategories", roomCateService.getRoomCates());
        return "management/view-room-categories";
    }

    @RequestMapping("/delete-category/{id}")
    public String deleteCategory(Model model,
            @PathVariable("id") long id) {

        if (!roomCateService.deleteCategory(id)) {
            return "redirect:/management/view-room-categories?message=Delete category success&messageType=success";

        } else {
            model.addAttribute("message", "Can't delete the room category that have a booking");
            model.addAttribute("messageType", "fail");
            model.addAttribute("roomCategories", roomCateService.getRoomCates());
            return "management/view-room-categories";
        }
    }

    //    --------SERVICE MANAGEMENT--------    
    @RequestMapping("/add-service")
    public String addService(Model model
    ) {
        model.addAttribute("service", new ServiceEntity());
        model.addAttribute("status", CommonStatus.values());
        model.addAttribute("action", "add");
        return "management/add-service";
    }

    @RequestMapping(value = "/done-add-service", method = RequestMethod.POST)
    public String doneAddService(Model model,
            @Valid @ModelAttribute("service") ServiceEntity service, BindingResult result,
            @RequestParam("files") MultipartFile[] files
    ) {
        if (result.hasErrors()) {
            model.addAttribute("action", "update");
            model.addAttribute("service", service);
            model.addAttribute("status", CommonStatus.values());
            System.out.println(result);
            return "/management/add-service";
        }
        if (!imageService.isValid(files)) {
            model.addAttribute("service", serviceService.findServiceById(service.getId()));
            model.addAttribute("result", "error");
            return "management/add-service";
        }
        String uploadRootPath = "D:\\DoAn\\Spring_MVC_Project_Final\\src\\main\\webapp\\resources\\image\\image-service";
        File uploadRootDir = new File(uploadRootPath);

        if (!uploadRootDir.exists()) {
            uploadRootDir.mkdirs();
        }

        ServiceEntity s = service;
        if (serviceService.isExists(service.getId())) {
            s = serviceService.findServiceById(service.getId());
        }

        List<ImageEntity> images = s.getImageEntitys();

        if (files.length > 0 && files != null) {
            List<File> uploadedFiles = new ArrayList<File>();
            for (MultipartFile fileData : files) {
                String name = fileData.getOriginalFilename();

                System.out.println("Client File Name = " + name);

                if (name != null && name.length() > 0) {
                    try {
                        File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);

                        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                        stream.write(fileData.getBytes());
                        stream.close();

                        uploadedFiles.add(serverFile);
                        ImageEntity img = new ImageEntity();
                        img.setName(name);
                        images.add(img);
                        img.setServiceEntity(s);
                        System.out.println("Write file: " + serverFile);
                    } catch (Exception e) {
                        System.out.println("Error Write file: " + name);
                    }
                }
            }
        }
        s.setCloseTime(service.getCloseTime());
        s.setDescription(service.getDescription());
        s.setLocation(service.getLocation());
        s.setName(service.getName());
        s.setOpenTime(service.getOpenTime());
        s.setPhoneNumber(service.getPhoneNumber());
        s.setPrice(service.getPrice());
        s.setStatus(service.getStatus());
        s.setImageEntitys(images);
        serviceService.save(s);
        return "redirect:/management/view-services";
    }

    @RequestMapping("/update-service/{id}")
    public String updateService(Model model,
            @PathVariable("id") long id
    ) {
        ServiceEntity service = serviceService.findServiceById(id);
        if (service.getId() > 0) {
            model.addAttribute("action", "update");
        } else {
            model.addAttribute("action", "add");
        }
        model.addAttribute("service", service);
        model.addAttribute("status", CommonStatus.values());
        return "management/add-service";
    }

    @RequestMapping(value = "/view-services", method = RequestMethod.GET)
    public String viewServices(Model model,
            @RequestParam(name = "message", required = false) String message,
            @RequestParam(name = "messageType", required = false) String messageType
    ) {
        model.addAttribute("message", message);
        model.addAttribute("messageType", messageType);
        model.addAttribute("services", serviceService.getServices());
        return "management/view-services";
    }

    @RequestMapping("/delete-service/{id}")
    public String deleteService(Model model,
            @PathVariable("id") long id
    ) {
        if (!serviceService.deleteService(id)) {
            return "redirect:/management/view-services?message=Delete service success&messageType=success";
        } else {
            model.addAttribute("message", "Delete fail");
            model.addAttribute("messageType", "fail");
            return "redirect:/management/view-services";
        }
    }
//-----------PROMOTION MANAGEMENT--------

    @RequestMapping("/add-promotion")
    public String addPromotion(Model model
    ) {
        model.addAttribute("promotion", new PromotionEntity());
        model.addAttribute("action", "add");
        return "management/add-promotion";
    }

    @RequestMapping(value = "/done-add-promotion", method = RequestMethod.POST)
    public String doneAddPromotion(Model model,
            @Valid @ModelAttribute("promotion") PromotionEntity promotion, BindingResult result,
            @RequestParam("files") MultipartFile[] files
    ) {
        if (!imageService.isValid(files)) {
            model.addAttribute("promotion", promotionService.findPromotionById(promotion.getId()));
            model.addAttribute("result", "error");
            return "management/add-promotion";
        }

        String uploadRootPath = "D:\\DoAn\\Spring_MVC_Project_Final\\src\\main\\webapp\\resources\\image\\image-promotion";
        File uploadRootDir = new File(uploadRootPath);

        if (!uploadRootDir.exists()) {
            uploadRootDir.mkdirs();
        }
        PromotionEntity p = promotion;
        if (promotionService.isExists(promotion.getId())) {
            p = promotionService.findPromotionById(promotion.getId());
        }

        List<ImageEntity> images = p.getImageEntitys();


        if (files.length > 0) {
            for (MultipartFile fileData : files) {
                String name = fileData.getOriginalFilename();
                if (name != null && name.length() > 0) {
                    try {
                        File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);

                        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                        stream.write(fileData.getBytes());
                        stream.close();

                        ImageEntity img = new ImageEntity();
                        img.setName(name);
                        images.add(img);

                        img.setPromotionEntity(p);
                        System.out.println("Write file: " + serverFile);
                    } catch (Exception e) {
                        System.out.println("Error Write file: " + name);
                    }
                }
            }
        }
        p.setName(promotion.getName());
        p.setDescription(promotion.getDescription());
        p.setCode(promotion.getCode());
        p.setDiscount(promotion.getDiscount());
        p.setStartDate(promotion.getStartDate());
        p.setEndDate(promotion.getEndDate());
        promotionService.save(p);

        return "redirect:/management/view-promotions";
    }

    @RequestMapping("/update-promotion/{id}")
    public String updatePromotion(Model model,
            @PathVariable("id") long id
    ) {
        PromotionEntity promotion = promotionService.findPromotionById(id);
        if (promotion.getId() > 0) {
            model.addAttribute("action", "update");
        } else {
            model.addAttribute("action", "add");
        }
        model.addAttribute("promotion", promotion);
        return "management/add-promotion";
    }

    @RequestMapping("/delete-promotion/{id}")
    public String deletePromotion(Model model,
            @PathVariable("id") long id) {
        if (!promotionService.deletePromotion(id)) {
            return "redirect:/management/view-promotions?message=Delete promotion success&messageType=success";
        } else {
            model.addAttribute("message", "Delete fail");
            model.addAttribute("messageType", "fail");
            return "redirect:/management/view-promotions";
        }
    }

    @RequestMapping(value = "/view-promotions", method = RequestMethod.GET)
    public String viewPromotions(Model model,
            @RequestParam(name = "message", required = false) String message,
            @RequestParam(name = "messageType", required = false) String messageType
    ) {
        model.addAttribute("message", message);
        model.addAttribute("messageType", messageType);
        model.addAttribute("promotions", promotionService.getPromotions());
        return "management/view-promotions";
    }
//    --------BOOKING MANAGEMENT--------    

    @RequestMapping(value = "/view-bookings", method = RequestMethod.GET)
    public String viewBookings(Model model,
            @RequestParam(name = "message", required = false) String message,
            @RequestParam(name = "messageType", required = false) String messageType
    ) {
        model.addAttribute("message", message);
        model.addAttribute("messageType", messageType);
        model.addAttribute("bookings", bookingService.getBookings());

        Map<Long, Double> map = bookingService.calBookingPrice(bookingService.getBookings());
        model.addAttribute("totalPrice", map);

        return "management/view-bookings";
    }

    @RequestMapping("/update-booking/{id}")
    public String updateBooking(Model model, HttpSession session,
            @PathVariable("id") long id) {
        BookingEntity booking = bookingService.getBookingbyId(id);
        model.addAttribute("booking", booking);
//        if (booking.getStatus().toString().equalsIgnoreCase("COMPLETED")) {
//            return "management/view-completed-booking";
//        }
        model.addAttribute("status", BookingStatus.values());
        return "management/update-booking";
    }

    @RequestMapping(value = "/done-update-booking", method = RequestMethod.POST)
    public String doneUpdateBooking(Model model,
            @ModelAttribute("booking") BookingEntity booking) {
        BookingEntity b = bookingService.getBookingbyId(booking.getId());

        b.setBookingDate(booking.getBookingDate());
        b.setCheckIn(booking.getCheckIn());
        b.setCheckOut(booking.getCheckOut());
        b.setStatus(booking.getStatus());
        b.setDiscount(booking.getDiscount());
        bookingService.save(b);
        return "redirect:/management/view-bookings";
    }

    @RequestMapping("/add-service-to-booking-detail/{id}")
    public String addServiceToBookingDetail(Model model, HttpSession session,
            @PathVariable("id") long id) {
        BookingDetailEntity bd = bookingDetailService.findBookingDetailById(id);
        model.addAttribute("min", bd.getBookingEntity().getCheckIn());
        model.addAttribute("max", bd.getBookingEntity().getCheckOut());
        model.addAttribute("services", serviceService.getServices());
        model.addAttribute("serviceBookingRoom", new ServiceBookingRoom());
        model.addAttribute("bookingDetail", bd);
        return "/management/add-service-to-booking";
    }

    @RequestMapping("/done-add-service-to-booking/{id}")
    public String doneAddServiceToBookingDetail(Model model, HttpSession session,
            @PathVariable("id") long id,
            @RequestParam(name = "serviceId", required = false) String serviceInput,
            @RequestParam(name = "useDate", required = false) String useDate,
            @RequestParam(name = "quantity", required = false) String quantity
    ) {
        serviceBookingRoomService.addServiceToBookingRoom(useDate, serviceInput, quantity, id);
        return "redirect:/management/add-service-to-booking-detail/{id}";
    }

    @RequestMapping("/delete-service-booking-room/{id}")
    public String deleteServiceBookingRoom(Model model,
            @PathVariable("id") long id) {
        if (!serviceBookingRoomService.deleteServiceBookingRoom(id)) {
//            return "redirect:/management/view-bookings?message=Delete service success&messageType=success";

            model.addAttribute("message", "Delete service success");
            model.addAttribute("messageType", "success");
            return "redirect:/management/view-bookings";
        } else {
            model.addAttribute("message", "Delete fail");
            model.addAttribute("messageType", "fail");
            return "redirect:/management/view-bookings";
        }
    }

    @RequestMapping("/delete-booking/{id}")
    public String deleteBooking(Model model,
            @PathVariable("id") long id) {
        if (!bookingService.deleteBooking(id)) {
            return "redirect:/management/view-bookings?message=Delete booking success&messageType=success";
        } else {
            model.addAttribute("message", "Delete fail");
            model.addAttribute("messageType", "fail");
            return "redirect:/management/view-bookings";
        }
    }
//    --------GUEST MANAGEMENT--------    

    @RequestMapping("/view-guests/{id}")
    public String viewGuestsByBookingDetail(Model model,
            @PathVariable("id") long id) {
        model.addAttribute("bookingDetail", bookingDetailService.findBookingDetailById(id));
        return "/management/view-guests-by-booking";
    }

    @RequestMapping("/update-guest/{id}")
    public String updateGuest(Model model, HttpSession session,
            @PathVariable("id") long id) {
        GuestEntity guest = guestService.findGuestById(id);
        if (guest.getId() > 0) {
            model.addAttribute("action", "update");
        } else {
            model.addAttribute("action", "add");
        }
        model.addAttribute("guest", guest);
        model.addAttribute("gender", Gender.values());
        return "/management/add-guest";
    }

    @RequestMapping("/add-guest-to-booking/{id}")
    public String addGuestToBooking(Model model,
            @PathVariable("id") long id) {
        BookingDetailEntity bde = bookingDetailService.findBookingDetailById(id);
        if (bde.getGuestEntitys().size() >= Integer.parseInt(bde.getRoomEntity().getRoomCategoryEntity().getCapacity())) {
            model.addAttribute("message", "Cannot add any guest to this room because of reaching max capacity");
            model.addAttribute("messageType", "fail");
            model.addAttribute("bookingDetail", bde);
            return "management/view-guests-by-booking";
        }

        model.addAttribute("action", "add");
        model.addAttribute("guest", new GuestEntity());
        model.addAttribute("bookingDetail", bde);
        model.addAttribute("gender", Gender.values());
        System.out.println(bde);
        return "/management/add-guest";

    }

    @RequestMapping(value = "/done-add-guest", method = RequestMethod.POST)
    public String doneAddGuest(
            @Valid @ModelAttribute("guest") GuestEntity guest, BindingResult result, Model model,
            @RequestParam(name = "bookingDetailId", required = false) String id) {
        if (result.hasErrors()) {
            model.addAttribute("action", "add");
            model.addAttribute("guest", guest);
            model.addAttribute("bookingDetail", bookingDetailService.findBookingDetailById(Long.parseLong(id)));
            model.addAttribute("gender", Gender.values());
            System.out.println(result);
            return "/management/add-guest";
        } else {
            BookingDetailEntity bd = bookingDetailService.findBookingDetailById(Long.parseLong(id));
            guest.setBookingDetailEntity(bd);
            bd.getGuestEntitys().add(guest);
            guestService.save(guest);
            model.addAttribute("bookingDetail", bookingDetailService.findBookingDetailById(Long.parseLong(id)));

            return "/management/view-guests-by-booking";
        }
    }

    @RequestMapping("/delete-guest/{id}")
    public String deleteGuest(Model model,
            @PathVariable("id") long id) {
        BookingDetailEntity bookingDetail = bookingDetailService.findBookingDetailById(guestService.findGuestById(id).getBookingDetailEntity().getId());
        if (!guestService.deleteGuest(id)) {
            model.addAttribute("message", "Delete guest success");
            model.addAttribute("messageType", "success");

        } else {
            model.addAttribute("message", "Delete fail");
            model.addAttribute("messageType", "fail");

        }
        model.addAttribute("bookingDetail", bookingDetailService.findBookingDetailById(bookingDetail.getId()));
        return "/management/view-guests-by-booking";
    }

    //    --------IMAGE MANAGEMENT--------    
    @RequestMapping("/delete-image-category/{id}")
    public String deleteImageCategory(Model model, HttpSession session,
            @PathVariable("id") long id
    ) {
        if (!imageService.deleteImage(id)) {
            return "redirect:/management/view-room-categories?message=Delete image success&messageType=success";
        } else {
            model.addAttribute("message", "Delete fail");
            model.addAttribute("messageType", "fail");
            return "redirect:/management/view-room-categories";
        }
    }

    @RequestMapping("/delete-image-promotion/{id}")
    public String deleteImagePromotion(Model model, HttpSession session,
            @PathVariable("id") long id
    ) {
        if (!imageService.deleteImage(id)) {
            return "redirect:/management/view-promotions?message=Delete image success&messageType=success";
        } else {
            model.addAttribute("message", "Delete fail");
            model.addAttribute("messageType", "fail");
            return "redirect:/management/view-promotions";
        }
    }

    @RequestMapping("/delete-image-service/{id}")
    public String deleteImageService(Model model, HttpSession session,
            @PathVariable("id") long id
    ) {
        if (!imageService.deleteImage(id)) {
            return "redirect:/management/view-services?message=Delete image success&messageType=success";
        } else {
            model.addAttribute("message", "Delete fail");
            model.addAttribute("messageType", "fail");
            return "redirect:/management/view-services";
        }
    }

    //-----INVOICE
    @RequestMapping("/print-invoice/{id}")
    public String printInvoice(Model model,
            @PathVariable("id") long id) {
        List<BookingEntity> list = new ArrayList();
        BookingEntity booking = bookingService.getBookingbyId(id);
        list.add(booking);
        model.addAttribute("booking", booking);
        model.addAttribute("totalPrice", bookingService.calBookingPrice(list));
        return "/print-invoice";
    }

}
