/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;


import com.mycompany.spring_mvc_project_final.enums.Gender;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PastOrPresent;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "guest")
public class GuestEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(length = 20)
    @NotBlank(message = "field is required")
    private String idCard;

    @Column(name = "phone")
    private String phoneNumber;

    @Column(length = 250)
    @NotBlank(message = "field is required")
    @Size(min = 5, max = 100, message = "must be greater than 5 and less than 100")
    private String fullName;

    @Column(length = 250)
    private String address;

    @Column(name = "birth_date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @PastOrPresent
    private Date birthDate;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    
    //relationship
    
    @ManyToOne
    @JoinColumn(name = "Bookingdetail_id")
    private BookingDetailEntity bookingDetailEntity;
    
    
//    ---------------------------------------------------------------

    public BookingDetailEntity getBookingDetailEntity() {
        return bookingDetailEntity;
    }

    public void setBookingDetailEntity(BookingDetailEntity bookingDetailEntity) {
        this.bookingDetailEntity = bookingDetailEntity;
    }
    
    
    
//    ------------------------------------------------------------------
    
    
    //Get and Set
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getidCard() {
        return idCard;
    }

    public void setidCard(String idCard) {
        this.idCard = idCard;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "GuestEntity{" + "id=" + id + ", bookingDetailEntity=" + bookingDetailEntity + '}';
    }
    
    

}
