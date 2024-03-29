package hcmuteshop.dao;

import java.util.List;

import hcmuteshop.entity.User;

public interface IDAOUser {

	boolean checkUserExist(String phone, String email);

	User findUserById(int id);

	User deleteUser(User user);

	List<User> getAllUser();

	User updateUser(User user);

	User insertUser(User user);

}
