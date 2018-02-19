
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query("select u from User r where u.userAccount.id = ?1")
	User findByUserAccountId(int userAccountId);

	@Query("select avg(r.trips.size),min(r.trips.size)," + "max(r.trips.size),sqrt(sum(r.trips.size *r.trips.size) / count(r.trips.size) - (avg(r.trips.size) * avg(r.trips.size))) from Ranger r")
	String userStats();

	@Query("select user from Reservation r join r.user user where r.rendezvous.id = ?1")
	Collection<User> findAttendantsByRendezvous(int rendezvousId);

	@Query("select user from Rendezvous r join r.user user where r.id = ?1")
	User findByRendezvous(int rendezvousId);
}
