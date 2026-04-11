package com.example.aiservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/v1/ai")
public class AiController {

    @GetMapping("/status")
    public Map<String, String> getStatus() {
        return Map.of(
            "status", "UP",
            "service", "ai-service",
            "message", "AI component is running securely managed by GitOps"
        );
    }
}
