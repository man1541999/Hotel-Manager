/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.ServiceBookingRoom;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author LENOVO
 */
@Repository
public interface ServiceBookingRoomRepository extends CrudRepository<ServiceBookingRoom, Long> {
//    List<ServiceBookingRoom> findByBookingDetailEntity(BookingDetailEntity bde);

    @Query(value = "select * from service_booking s\n"
            + " inner join booking_detail b on s.id = b.id"
            + " where b.id = ?1", nativeQuery = true)
    List<ServiceBookingRoom> findByBookingDetailEntityId(long id);
    
    @Query("select sbr from ServiceBookingRoom sbr where sbr.useDate = ?1 and sbr.serviceEntity.id = ?2")
    ServiceBookingRoom findSBRByUseDate(Date date, long id);
}
