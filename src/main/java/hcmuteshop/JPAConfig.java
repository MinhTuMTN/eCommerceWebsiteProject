package hcmuteshop;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAConfig {
	static EntityManagerFactory factory;
	static EntityManager entityManager;
	
	static {
		factory = Persistence.createEntityManagerFactory("jpaSQL");
	}
	
	public static EntityManager getEntityManager() {	

		return factory.createEntityManager();

	}

	public static void main(String[] args) {
		getEntityManager();
		factory.close();
	}
}