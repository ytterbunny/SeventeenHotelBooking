package com.spring.service;

import com.spring.dao.AdminMenuDAO;
import com.spring.entity.MenuEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AdminMenuServiceImpl implements AdminMenuService {
    @Autowired
    AdminMenuDAO adminMenuDAO;

    @Override
    @Transactional
    public List<MenuEntity> listAllFoods() {
        return adminMenuDAO.listAllFoods();
    }

    @Override
    @Transactional
    public void saveUpdateFood(MenuEntity food) {
        adminMenuDAO.saveUpdateFood(food);
    }

    @Override @Transactional
    public void deleteFood(int menuId) { adminMenuDAO.deleteFood(menuId); }

    @Override @Transactional
    public MenuEntity getFoodById(int menuId) { return adminMenuDAO.getFoodById(menuId); }

    @Override @Transactional
    public void updateExistingDish(MenuEntity food) { adminMenuDAO.updateExistingDish(food); }
}
