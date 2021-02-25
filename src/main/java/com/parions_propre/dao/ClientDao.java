package com.parions_propre.dao;

import com.parions_propre.beans.Client;

public interface ClientDao {

    void creer( Client client ) throws DAOException;

    Client trouver( String email ) throws DAOException;

    void supprimer( Client client ) throws DAOException;

}
