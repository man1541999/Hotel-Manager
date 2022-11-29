/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.CommonStatus;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "service")
public class ServiceEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    
    @Column(length = 100)
    @NotBlank(message = "field is required")
    @Size(min = 5, max = 200, message = "must be greater than 5 and less than 200")
    private String name;
    
    @Column
    @NotNull(message = "field is required")
    private double price;
    
    @Column(length = 100)
    private String location;
    
    @Column(length = 20)
    private String openTime;
    
    @Column(length = 20)
    private String closeTime;
    
    @Column(length = 2000)
    private String description;
    
    @Column(length = 20)
    private String phoneNumber;
    
    @Column(length = 50, nullable = false)
    @Enumerated(EnumType.STRING)
    private CommonStatus status;
    
    
    
    //relationship
    
    @OneToMany(mappedBy = "serviceEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ImageEntity> imageEntitys = new ArrayList<>();
    
    @OneToMany(mappedBy = "serviceEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ServiceBookingRoom> serviceBookingRooms = new ArrayList<>();
    
    
    
    //------------------------------------------------------------------------

    public List<ImageEntity> getImageEntitys() {
        return imageEntitys;
    }

    public void setImageEntitys(List<ImageEntity> imageEntitys) {
        this.imageEntitys = imageEntitys;
    }

    public List<ServiceBookingRoom> getServiceBookingRooms() {
        return serviceBookingRooms;
    }

    public void setServiceBookingRooms(List<ServiceBookingRoom> serviceBookingRooms) {
        this.serviceBookingRooms = serviceBookingRooms;
    }
    
    //---------------------------------------------------------------------------
    
    //Get and Set

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public String getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(String closeTime) {
        this.closeTime = closeTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public CommonStatus getStatus() {
        return status;
    }

    public void setStatus(CommonStatus status) {
        this.status = status;
    }
    

    @Override
    public String toString() {
        return "ServiceEntity{" + "id=" + id + ", name=" + name + ", price=" + price + ", location=" + location + ", openTime=" + openTime + ", closeTime=" + closeTime + ", description=" + description + ", phoneNumber=" + phoneNumber + ", status=" + status +  '}';
    }
    
    
    
}
