/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.AnnexeAdministratif;
import bean.Locale;
import bean.Quartier;
import bean.Redevable;
import bean.Rue;
import bean.Secteur;
import controler.util.SearchUtil;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author HP
 */
@Stateless
public class LocaleFacade extends AbstractFacade<Locale> {

    @EJB
    private QuartierFacade quartierFacade;
    @EJB
    private AnnexeAdministratifFacade annexeAdministratifFacade;
    @EJB
    private SecteurFacade secteurFacade;

    @PersistenceContext(unitName = "projet_java_taxPU")
    private EntityManager em;

    public List<Locale> findByRedevableCin(String redevable) {
        return em.createQuery("SELECT l FROM Locale l WHERE l.proprietaire.cin='" + redevable + "' OR l.gerant.cin='" + redevable + "'").getResultList();
    }

    public List<Locale> findByRedevableRc(String redevable) {
        return em.createQuery("SELECT l FROM Locale l WHERE l.proprietaire.rc= '" + redevable + "' OR l.gerant.rc='" + redevable + "'").getResultList();
    }

    public List<Locale> findByGerantOrProprietaire(Locale locale) {
        String requette = "SELECT l FROM Locale l WHERE 1=1";
        if (locale.getProprietaire() != null) {
            requette += SearchUtil.addConstraint("l", "proprietaire.id", "=", locale.getProprietaire().getId());
        }
        if (locale.getCategorie()!=null)  {
            requette += SearchUtil.addConstraint("l", "categorie", "=", locale.getCategorie().getId());
        }
        if (locale.getReference()!=null) {
            requette += SearchUtil.addConstraint("l", "rference", "=",locale.getReference());
        }
        return em.createQuery(requette).getResultList();
      
    }

    public List<Redevable> findByReference(Locale locale) {
        return em.createQuery("SELECT l FROM Locale l WHERE l.reference='" + locale.getReference() + "'").getResultList();
    }

    public List<Locale> findByCinOrRc(Redevable redevable, String activite) {
        String requette = "SELECT l FROM Locale l WHERE 1=1";
        requette += SearchUtil.addConstraint("l", "rdevable.id", "=", redevable.getId());
        if (!"".equals(redevable.getCin())) {
            requette += SearchUtil.addConstraint("l", "activite", "=", activite);
        }
        if (!"".equals(redevable.getRc())) {
            requette += SearchUtil.addConstraint("l", "rc", "=", redevable.getRc());
        }
        return em.createQuery(requette).getResultList();
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public void generateReference(Rue rue, Locale locale) {
        Quartier quartier = quartierFacade.find(rue.getQuartier().getId());
        AnnexeAdministratif annexeAdministratif = annexeAdministratifFacade.find(quartier.getAnnexeAdministratif().getId());
        Secteur secteur = secteurFacade.find(annexeAdministratif.getSecteur().getId());
        locale.setReference(rue.getNumAbreviation() + "-" + quartier.getNumAbreviation() + "-" + annexeAdministratif.getAbreviation() + "-" + secteur.getAbreviation());
    }

    public LocaleFacade() {
        super(Locale.class);
    }

}
