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
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import org.hibernate.Hibernate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "room_category")
public class RoomCategoryEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(length = 100, unique = true)
    @NotBlank(message = "field is required")
    private String name;

    @Column(length = 2000)
    private String description;

    @Column()
    private int area;

    @Column(length = 1)
    private int numberOfBed;

    @Column(length = 20)
    private String capacity;

    @Column
    private double price;

//    @Column(length = 50, nullable = false)
//    @Enumerated(EnumType.STRING)
//    private CommonStatus status;

    //Relationship
    @OneToMany(mappedBy = "roomCategoryEntity", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.EAGER)
    private List<ImageEntity> imageEntitys = new ArrayList<>();

    @OneToMany(mappedBy = "roomCategoryEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<RoomEntity> roomEntitys = new ArrayList<>();

    @Transient
    private MultipartFile file;

    //-------------------------------------------------------------------------
    public List<ImageEntity> getImageEntitys() {
        return imageEntitys;
    }

    public void setImageEntitys(List<ImageEntity> imageEntitys) {
        this.imageEntitys = imageEntitys;
    }

    public List<RoomEntity> getRoomEntitys() {
        return roomEntitys;
    }

    public void setRoomEntitys(List<RoomEntity> roomEntitys) {
        this.roomEntitys = roomEntitys;
    }

    //-------------------------------------------------------------------------
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getNumberOfBed() {
        return numberOfBed;
    }

    public void setNumberOfBed(int numberOfBed) {
        this.numberOfBed = numberOfBed;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

//    public CommonStatus getStatus() {
//        return status;
//    }
//
//    public void setStatus(CommonStatus status) {
//        this.status = status;
//    }

    

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "RoomCategoryEntity{" + "name=" + name + ", description=" + description + '}';
    }

}
