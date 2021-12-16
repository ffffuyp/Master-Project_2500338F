package cn.controller;


import static org.junit.Assert.assertEquals;

import java.io.IOException;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;


public class ActionTest extends BasicJunitTest {

    @Before
    public void setUp() throws Exception{
    }
	@After
	public void tearDown() throws Exception {
	}
	@Autowired
	private DownloadAction TestAction;	
	@Test
	public void DownloadTest() throws IOException {
	

		TestAction.filePath = "";
		String c = TestAction.execute();	
		System.out.println(c);
		assertEquals(c, "success");
		System.out.println("Download test passed");
	}
}
