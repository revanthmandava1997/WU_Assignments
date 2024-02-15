package com.java.Java_Examples;

import com.intuit.karate.junit5.Karate;

class karateRunner {
    
	@Karate.Test
    Karate testUsers() {
        return Karate.run("karate").relativeTo(getClass());
    }   

}
