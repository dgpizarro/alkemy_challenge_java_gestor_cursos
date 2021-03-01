package com.alkemy.challenge.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PassGenerator {

    public static void main(String... args) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(11);

        System.out.println(bCryptPasswordEncoder.encode("1234"));

    }
}
