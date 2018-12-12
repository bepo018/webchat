package com.glkj.webchat.service.ex;

public class UsernameAlreadExistsException extends RuntimeException {
    public UsernameAlreadExistsException() {
    }

    public UsernameAlreadExistsException(String message) {
        super(message);
    }

    public UsernameAlreadExistsException(String message, Throwable cause) {
        super(message, cause);
    }

    public UsernameAlreadExistsException(Throwable cause) {
        super(cause);
    }

    public UsernameAlreadExistsException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
