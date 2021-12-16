package cn.entity;


import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class UnitTest {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}
	@Test
	public void TestNameset() {
		TGaojian gaojian1 = new TGaojian();
		gaojian1.setName("nametest");
		
		assertEquals("nametest", gaojian1.getName());
		System.out.println("Name test passed"); 
	}
	@Test
	public void TestStatus() {
		TGaojian gaojian1 = new TGaojian();
		gaojian1.setStatus("assigned");
		
		assertEquals("assigned", gaojian1.getStatus());
		System.out.println("Status test passed"); 
	}
	@Test
	public void TestUserNameset() {
		TUser user1 = new TUser();
		user1.setName("Usernametest");
		
		assertEquals("Usernametest", user1.getName());
		System.out.println("Username test passed"); 
	}
	@Test
	public void TestUserpasswordSet() {
		TUser user2 = new TUser();
		user2.setPassword("123456");
		
		assertEquals("123456", user2.getPassword());
		System.out.println("Userpassword test passed"); 
	}
	@Test
	public void TestUserpasswordReset() {
		TUser user2 = new TUser();
		user2.setPassword("123456");
		
		assertEquals("123456", user2.getPassword());
		System.out.println("Userpassword test passed"); 
	}

}
