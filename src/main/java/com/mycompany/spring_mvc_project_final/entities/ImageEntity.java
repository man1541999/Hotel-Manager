/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "image")
public class ImageEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull    
    @Column(length = 100, unique = true)
    private String name;
    
    @Transient
    private CommonsMultipartFile[] fileDatas;
    
    @Transient
    private MultipartFile[] imgFiles;

    //Relationship
    
    @ManyToOne
    @JoinColumn(name = "roomCategory_id")
    private RoomCategoryEntity roomCategoryEntity;
    
    
    @ManyToOne
    @JoinColumn(name = "service_id")
    private ServiceEntity serviceEntity;
    
    @ManyToOne
    @JoinColumn(name = "promotion_id")
    private PromotionEntity promotionEntity;
    
    //-----------------------------------------------------------------------

    public RoomCategoryEntity getRoomCategoryEntity() {
        return roomCategoryEntity;
    }

    public void setRoomCategoryEntity(RoomCategoryEntity roomCategoryEntity) {
        this.roomCategoryEntity = roomCategoryEntity;
    }

    public ServiceEntity getServiceEntity() {
        return serviceEntity;
    }

    public void setServiceEntity(ServiceEntity serviceEntity) {
        this.serviceEntity = serviceEntity;
    }

    public PromotionEntity getPromotionEntity() {
        return promotionEntity;
    }

    public void setPromotionEntity(PromotionEntity promotionEntity) {
        this.promotionEntity = promotionEntity;
    }
    
    
    //--------------------------------------------------------------------------

//    public ImageEntity(String name) {
//        this.name = name;
//    }
//    
//    public ImageEntity(){
//        
//    }
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

    public CommonsMultipartFile[] getFileDatas() {
        return fileDatas;
    }

    public void setFileDatas(CommonsMultipartFile[] fileDatas) {
        this.fileDatas = fileDatas;
    }

    public MultipartFile[] getImgFiles() {
        return imgFiles;
    }

    public void setImgFiles(MultipartFile[] imgFiles) {
        this.imgFiles = imgFiles;
    }

    @Override
    public String toString() {
        return "ImageEntity{" + "name=" + name + '}';
    }

}
