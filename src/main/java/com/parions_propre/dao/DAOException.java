package com.parions_propre.dao;

public class DAOException extends RuntimeException {
    public DAOException( String message ) {
        super( message );
    }

    public DAOException( Throwable cause ) {
        super( cause );
    }
}
