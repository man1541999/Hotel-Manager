/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.repository.ImageRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author LENOVO
 */
@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    public ImageEntity findImageByName(String name) {
        ImageEntity imgOtp = imageRepository.findByName(name);
        if (imgOtp != null) {
            return imgOtp;
        }
        return new ImageEntity();
    }

    public boolean deleteImage(long id) {
        Optional<ImageEntity> imgOtp = imageRepository.findById(id);
        if (imgOtp != null) {
            imageRepository.deleteById(id);
            return imageRepository.existsById(id);
        }
        return true;
    }

    public void deleteImagesByName(String[] names) {
        for (int i = 0; i < names.length; i++) {
            Long id = Long.parseLong(names[i]);
            imageRepository.deleteById(id);
        }
    }

    public boolean isDuplicated(MultipartFile[] files) {
        for (MultipartFile fileData : files) {
            String name = fileData.getOriginalFilename();
            return imageRepository.getListName().contains(name);
        }
        return false;
    }

    private boolean isSupportedContentType(String contentType) {
        return contentType.equals("image/png")
                || contentType.equals("image/jpg")
                || contentType.equals("image/jpeg");
    }

    public boolean isValid(MultipartFile[] files) {

        boolean result = true;

        for (MultipartFile fileData : files) {
            String contentType = fileData.getContentType();
            String fileName = fileData.getOriginalFilename();
            if (fileName != null && fileName.length() > 0) {
                if (!isSupportedContentType(contentType)) {
                    System.out.println(!isSupportedContentType(contentType));
                    result = false;
                }
                if (isDuplicated(files)) {
                    System.out.println(isDuplicated(files));
                    result = false;
                }
            }
        }
        return result;
    }
}
