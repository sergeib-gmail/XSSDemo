package com.example.demo;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.owasp.encoder.Encode;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;

@RestController
public class Greetings {
    private static final Logger LOGGER = LogManager.getLogger(Greetings.class);
    @RequestMapping("/")
    String home(@RequestParam(value = "name", defaultValue = "World") String name) throws UnsupportedEncodingException {
        String decodedValue = java.net.URLDecoder.decode(name, StandardCharsets.UTF_8.name());
        LOGGER.info("This is an INFO level log message! " + decodedValue);
        LOGGER.error("This is an ERROR level log message! " + decodedValue);
        return "Hello from " + name + "!";
        //return "Hello from " + Encode.forHtml( name ) + "!"; // Fix for html tags
    }

}