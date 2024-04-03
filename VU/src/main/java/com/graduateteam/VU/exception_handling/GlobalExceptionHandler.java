package com.graduateteam.VU.exception_handling;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.Arrays;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(OutIndexException.class)
    public ResponseEntity<?> handleOutIndexException(OutIndexException outIndexException){
        CustomResponse customResponse=new CustomResponse(outIndexException.getMessage(), Arrays.asList(outIndexException.getMessage()));

        return ResponseEntity
                .status(HttpStatus.NOT_FOUND)
                .body(customResponse);
    }
}
