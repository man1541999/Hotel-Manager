/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;


import com.mycompany.spring_mvc_project_final.entities.RoomCategoryEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ADMIN
 */
@Repository
public interface RoomCateRepository extends CrudRepository<RoomCategoryEntity, Long>{
    
    public RoomCategoryEntity findByName(String name);
}
