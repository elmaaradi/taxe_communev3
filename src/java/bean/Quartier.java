/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author ayoub
 */
@Entity
public class Quartier implements Serializable {

    

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nom;
    private int numAbreviation;
    @ManyToOne
    private AnnexeAdministratif annexeAdministratif;

    @OneToMany(mappedBy = "quartier")
    private List<Rue> rues;
    
    public Quartier() {
    }

    public List<Rue> getRues() {
        return rues;
    }

    public void setRues(List<Rue> rues) {
        this.rues = rues;
    }

    public int getNumAbreviation() {
        return numAbreviation;
    }

    public void setNumAbreviation(int numero) {
        this.numAbreviation = numero;
    }
    
    

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public AnnexeAdministratif getAnnexeAdministratif() {
        if(annexeAdministratif==null){
            annexeAdministratif=new AnnexeAdministratif();
        }
        return annexeAdministratif;
    }

    public void setAnnexeAdministratif(AnnexeAdministratif annexeAdministratif) {
        this.annexeAdministratif = annexeAdministratif;
    }
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Quartier)) {
            return false;
        }
        Quartier other = (Quartier) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return nom;
    }
    
}
