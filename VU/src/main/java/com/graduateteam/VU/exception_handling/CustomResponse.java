package com.graduateteam.VU.exception_handling;

import java.time.LocalDateTime;
import java.util.List;

public class CustomResponse {
    private Boolean success;
    private String message;
    private LocalDateTime localDateTime;
    private List<String> details;

    public CustomResponse(String message, List<String> details) {
        this.message = message;
        this.details = details;
        this.localDateTime =LocalDateTime.now();
        this.success =false;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getLocalDateTime() {
        return localDateTime;
    }

    public void setLocalDateTime(LocalDateTime localDateTime) {
        this.localDateTime = localDateTime;
    }

    public List<String> getDetails() {
        return details;
    }

    public void setDetails(List<String> details) {
        this.details = details;
    }
}
