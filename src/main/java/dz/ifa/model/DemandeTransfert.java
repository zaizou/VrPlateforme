package dz.ifa.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;




	@Entity
	@Table(name="demandeTransfert")

	public class DemandeTransfert<E> {

		
		@TableGenerator(name="demandeTransfertGen", allocationSize=1)
		
		@Id
		@GeneratedValue(strategy=GenerationType.TABLE, generator="demandeTransfertGen")
		@Column(name="DEMANDETRANSFERT_ID")
		private Long id;
		
		@Column(name="NUM_DEMANDE")
		private String num_demande;
		
		@Column(name="DATE_DEMANDE")
		private String date_demande;

		@Column(name="MONTANT")
		private float  montant;
		
		@Column(name="ETAT")
		private String  etat;
		
		@Column(name="CODE_MONNAIE")
		private String code_monnaie;
		
		@Column(name="NUM_CHAPITRE")
		private String  num_chapitre;
		
		@Column(name="NUM_RUBRIQUE")
		private String  num_rubrique;
		
		@Column(name="DESIGNATION")
		private String  designation;
		
		
	
	
	

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getNum_demande() {
			return num_demande;
		}

		public void setNum_demande(String num_demande) {
			this.num_demande = num_demande;
		}

		public String getDate_demande() {
			return date_demande;
		}

		public void setDate_demande(String date_demande) {
			this.date_demande = date_demande;
		}

		public float getMontant() {
			return montant;
		}

		public void setMontant(float montant) {
			this.montant = montant;
		}

		public String getEtat() {
			return etat;
		}

		public void setEtat(String etat) {
			this.etat = etat;
		}

		public String getNum_chapitre() {
			return num_chapitre;
		}

		public void setNum_chapitre(String num_chapitre) {
			this.num_chapitre = num_chapitre;
		}

		public String getNum_rubrique() {
			return num_rubrique;
		}

		public void setNum_rubrique(String num_rubrique) {
			this.num_rubrique = num_rubrique;
		}

		public String getDesignation() {
			return designation;
		}

		public void setDesignation(String designation) {
			this.designation = designation;
		}

		public String getCode_monnaie() {
			return code_monnaie;
		}

		public void setCode_monnaie(String code_monnaie) {
			this.code_monnaie = code_monnaie;
		}

}
