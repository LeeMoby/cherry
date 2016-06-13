package com.moby.exception;

/**
 * 秒杀关闭异常
 * Created by Moby on 16/6/8.
 */
public class SeckillCloseException extends SeckillException {
    public SeckillCloseException(String message) {
        super(message);
    }

    public SeckillCloseException(String message, Throwable cause) {
        super(message, cause);
    }

}
