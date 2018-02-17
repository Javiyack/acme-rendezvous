/*
 * ManagerService.java
 * 
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.UserRepository;
import security.LoginService;
import security.UserAccount;
import domain.User;

@Service
@Transactional
public class UserService {

	// Managed repository -----------------------------------------------------

	@Autowired
	private UserRepository	userRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------

	public UserService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public User create() {
		User result;

		result = new User();
		Assert.notNull(result);

		return result;
	}

	public Collection<User> findAll() {
		Collection<User> result;

		result = this.userRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public User findOne(final int explorerId) {
		User result;

		result = this.userRepository.findOne(explorerId);
		Assert.notNull(result);

		return result;
	}

	public User save(final User explorer) {
		Assert.notNull(explorer);

		User result;

		result = this.userRepository.save(explorer);

		return result;
	}

	public void delete(final User explorer) {
		Assert.notNull(explorer);
		Assert.isTrue(explorer.getId() != 0);

		this.userRepository.delete(explorer);
	}

	// Other business methods -------------------------------------------------

	public User findByPrincipal() {
		User result;
		UserAccount userAccount;

		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);
		result = this.findByUserAccount(userAccount);
		Assert.notNull(result);

		return result;
	}

	public User findByUserAccount(final UserAccount userAccount) {
		Assert.notNull(userAccount);

		User result;

		result = this.userRepository.findByUserAccountId(userAccount.getId());

		return result;
	}

}
