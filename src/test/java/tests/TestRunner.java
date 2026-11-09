package tests;
import org.junit.jupiter.api.BeforeEach;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;


public class TestRunner {
	@Karate.Test
    Karate testFirst() {
        //return Karate.run("classpath:tests");
		return Karate.run("classpath:tests/Get.feature").tags("@firstTest");
    }
	
	@BeforeEach
	 public void setupEnv() {
		System.setProperty("karate.env", " ");
	}
}
