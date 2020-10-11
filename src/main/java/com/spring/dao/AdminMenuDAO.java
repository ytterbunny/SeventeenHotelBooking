package com.spring.dao;

import com.spring.entity.MenuEntity;

import java.util.List;

public interface AdminMenuDAO {
    public List<MenuEntity> listAllFoods();
    public void saveUpdateFood(MenuEntity food);
    public void deleteFood(int menuId);
}
