package com.fun.rrs.repositories;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import com.fun.rrs.model.User;

public interface UserRepository extends CrudRepository<User, String>{
	public List<User> findAll(Sort sort);

}
