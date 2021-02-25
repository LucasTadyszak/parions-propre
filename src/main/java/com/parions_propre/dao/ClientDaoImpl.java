package com.parions_propre.dao;

import com.parions_propre.beans.Client;
import static com.parions_propre.dao.DAOUtilitaire.*;
import java.sql.*;

public class ClientDaoImpl implements ClientDao{

    private DAOFactory daoFactory;
    private static final String SQL_SELECT_PAR_EMAIL = "SELECT * FROM client WHERE email = ?";
    private static final String SQL_INSERT = "INSERT INTO client (email, nom, prenom, pseudo, mot_de_passe, naissance, telephone, newletter, genre, categorie, creation) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'free', NOW())";
    private static final String SQL_DELETE_PAR_EMAIL = "DELETE FROM client where email = ?";

    ClientDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }

    /*
     * Simple méthode utilitaire permettant de faire la correspondance (le
     * mapping) entre une ligne issue de la table des clients (un
     * ResultSet) et un bean Client.
     */
    private static Client map( ResultSet resultSet ) throws SQLException {
        Client client = new Client();
        client.setEmail( resultSet.getString( "email" ) );
        client.setPseudo( resultSet.getString( "pseudo" ) );
        client.setNom( resultSet.getString( "nom" ) );
        client.setPrenom( resultSet.getString( "prenom" ) );
        client.setMotDePasse( resultSet.getString( "mot_de_passe" ) );
        client.setNaissance( resultSet.getDate( "naissance" ) );
        client.setNewletter( resultSet.getString( "newletter" ) );
        client.setCategorie( resultSet.getString( "categorie" ) );
        client.setCreation( resultSet.getDate( "creation" ) );
        return client;
    }

    /* Implémentation de la méthode définie dans l'interface ClientDao */
    @Override
    public Client trouver(String email) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Client client = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_PAR_EMAIL, false, email );
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de données de l'éventuel ResulSet retourné */
            if ( resultSet.next() ) {
                client = map( resultSet );
            }
        } catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return client;
    }

    /* Implémentation de la méthode supprimer() définie dans l'interface ClientDao */
    @Override
    public void supprimer(Client client) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_DELETE_PAR_EMAIL, true, client.getEmail() );
            int statut = preparedStatement.executeUpdate();
            if ( statut == 0 ) {
                throw new DAOException( "Échec de la suppression du client, aucune ligne supprimée de la table." );
            }
        } catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( preparedStatement, connexion );
        }
    }

    /* Implémentation de la méthode creer() définie dans l'interface ClientDao */
    @Override
    public void creer( Client client ) throws IllegalArgumentException, DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_INSERT, true, client.getEmail(), client.getNom(), client.getPrenom(), client.getPseudo(), client.getMotDePasse(), client.getNaissance(), client.getTelephone(), client.getNewletter(), client.getGenre(), client.getCategorie());
            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
                throw new DAOException( "Échec de la création du client, aucune ligne ajoutée dans la table." );
            }
            /* Récupération de l'id auto-généré par la requête d'insertion */
            valeursAutoGenerees = preparedStatement.getGeneratedKeys();
        } catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( valeursAutoGenerees, preparedStatement, connexion );
        }
    }
}

