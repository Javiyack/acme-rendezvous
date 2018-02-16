/*
 * AdministratorService.java
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

import repositories.AdministratorRepository;
import security.LoginService;
import security.UserAccount;
import domain.Administrator;

@Service
@Transactional
public class AdministratorService {

	// Managed repository -----------------------------------------------------

	@Autowired
	private AdministratorRepository	explorerRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------

	public AdministratorService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Administrator create() {
		Administrator result;

		result = new Administrator();
		Assert.notNull(result);

		return result;
	}

	public Collection<Administrator> findAll() {
		Collection<Administrator> result;

		result = this.explorerRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Administrator findOne(final int explorerId) {
		Administrator result;

		result = this.explorerRepository.findOne(explorerId);
		Assert.notNull(result);

		return result;
	}

	public Administrator save(final Administrator explorer) {
		Assert.notNull(explorer);

		Administrator result;

		result = this.explorerRepository.save(explorer);

		return result;
	}

	public void delete(final Administrator explorer) {
		Assert.notNull(explorer);
		Assert.isTrue(explorer.getId() != 0);

		this.explorerRepository.delete(explorer);
	}

	// Other business methods -------------------------------------------------

	public Administrator findByPrincipal() {
		Administrator result;
		UserAccount userAccount;

		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);
		result = this.findByUserAccount(userAccount);
		Assert.notNull(result);

		return result;
	}

	public Administrator findByUserAccount(final UserAccount userAccount) {
		Assert.notNull(userAccount);

		Administrator result;

		result = this.explorerRepository.findByUserAccountId(userAccount.getId());

		return result;
	}

}
