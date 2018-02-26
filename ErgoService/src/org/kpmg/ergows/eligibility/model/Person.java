/**
 * 
 */
package org.kpmg.ergows.eligibility.model;

import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.vfs2.FileObject;
import org.apache.commons.vfs2.FileSystemManager;
import org.apache.commons.vfs2.VFS;
import org.kpmg.ergows.eligibility.util.ErgoCalculations;


/**
 * @author jcouk
 *
 */
public class Person {

	private int age;
	private Boolean hhMemberOlderThanSixtyFive;
	private String name; 
	private Double income;
	private int hhSize;
	private Boolean interestedInMedicaid;
	private Boolean interestedInTANF;
	private Boolean interestedInSNAP;
	private Boolean snapEligible;
	private Boolean medicaidEligible;
	private Boolean tanfEligible;
	private Boolean incomeLimitsCalculated;
	
	
	
	private Boolean householdBenefitsAssessed = false;
	
		
	/**
	 * @return the name
	 * 
	 * No Need to add getter specific to ergo.  This will be used by other ergo getter methods
	 */
	public String getName() {
		
		if(name.isEmpty())
		{
			name = "Nobody";
		}
		
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	
	/**
	 * @param income the income to set
	 */
	public void setIncome(Double income) {
		this.income = income;
	}
	
	/**
	 * @return the income
	 */
	public Double getIncome() {
		return income;
	}
	
	/**
	 * @return the income in Ergo Text form.
	 */
	public String getErgoIncome() {
		
		String totalGrossIncome = Double.toString(this.getIncome());
		if(totalGrossIncome != null)
		{
			totalGrossIncome = "insert{" + this.getName() +"[totalGrossIncome -> " + Double.toString(this.getIncome()) + "]@basic_mod}.";
		}
		return totalGrossIncome;
	}
	
	/**
	 * @return the hhSize
	 */
	public int getHhSize() {
		return hhSize;
	}
	/**
	 * @param hhSize the hhSize to set
	 */
	public void setHhSize(int hhSize) {
		this.hhSize = hhSize;
	}
	
	/**
	 * @return the hhSize in String ergo Format
	 */
	public String getErgoHhSize() {
		String personHHSize = String.valueOf(this.getHhSize());
		if(personHHSize != null)
		{
			personHHSize = "insert{"+this.getName()+"[householdSize ->" +  String.valueOf(this.getHhSize()) + "]@basic_mod}.";
		}
		
		return personHHSize;
	}
	
	/**
	 * @return the householdBenefitsAssessed
	 */
	public Boolean getHouseholdBenefitsAssessed() {
		return householdBenefitsAssessed;
	}
	/**
	 * @param householdBenefitsAssessed the householdBenefitsAssessed to set
	 */
	public void setHouseholdBenefitsAssessed(Boolean householdBenefitsAssessed) {
		this.householdBenefitsAssessed = householdBenefitsAssessed;
	}
	
	/**
	 * @return the Ergo format householdBenefitsAssessed query
	 */
	public String getErgoHouseholdBenefitsAssessed() {
		
		String personHHBenefitAssessed = "?person[householdBenefitsAssessed]";
		
		return personHHBenefitAssessed;
	}
	
	//new String result;
	
	/**
	 * @return the tanfEligible
	 */
	public Boolean getTanfEligible() {
		return tanfEligible;
	}
	/**
	 * @param tanfEligible the tanfEligible to set
	 */
	public void setTanfEligible(Boolean tanfEligible) {
		this.tanfEligible = tanfEligible;
	}
	/**
	 * @return the ergo statement for tanfEligible
	 */
	public String getErgoTanfEligible() {
		
		String ergoTanfEligible = "?person[householdIsPotentiallyTanfEligible]";
		
		return ergoTanfEligible;
	}
	/**
	 * @param tanfEligible the tanfEligible to set
	 */
	/**
	 * @return the medicaidEligible
	 */
	public Boolean getMedicaidEligible() {
		return medicaidEligible;
	}
	/**
	 * @param medicaidEligible the medicaidEligible to set
	 */
	public void setMedicaidEligible(Boolean medicaidEligible) {
		this.medicaidEligible = medicaidEligible;
	}
	/**
	 * @return the ergo statement for tanfEligible
	 */
	public String getErgoMedicaidEligible() {
		
		String ergoMedEligible = "?person[householdIsPotentiallyMedicaidEligible]";
		
		return ergoMedEligible;
	}
	
	/**
	 * @return the incomeLimitsCalculated
	 */
	public Boolean getIncomeLimitsCalculated() {
		return incomeLimitsCalculated;
	}
	/**
	 * @param incomeLimitsCalculated the incomeLimitsCalculated to set
	 */
	public void setIncomeLimitsCalculated(Boolean incomeLimitsCalculated) {
		this.incomeLimitsCalculated = incomeLimitsCalculated;
	}
	/**
	 * @param incomeLimitsCalculated the incomeLimitsCalculated to set
	 */
	public String getErgoQueryIncomeLimitsCalculated() {
		String query = "?person[incomeLimitsCalculated]";
		
		return query;
	}
	/**
	 * @return the snapEligible
	 */
	public Boolean getSnapEligible() {
		return snapEligible;
	}
	/**
	 * @param snapEligible the snapEligible to set
	 */
	public void setSnapEligible(Boolean snapEligible) {
		this.snapEligible = snapEligible;
	}
	
	/**
	 * @return the ergo statement for snapEligible
	 */
	public String getErgoSnapEligible() {
		
		String ergoSnapEligible = "?person[householdIsPotentiallyTanfEligible]";
		
		return ergoSnapEligible;
	}
	
	
	/**
	 * @return the hhMemberOlderThanSixtyFive
	 */
	public Boolean getHhMemberOlderThanSixtyFive() {
		return hhMemberOlderThanSixtyFive;
	}
	/**
	 * @param hhMemberOlderThanSixtyFive the hhMemberOlderThanSixtyFive to set
	 */
	public void setHhMemberOlderThanSixtyFive(Boolean hhMemberOlderThanSixtyFive) {
		this.hhMemberOlderThanSixtyFive = hhMemberOlderThanSixtyFive;
	}
	public String getErgoHhMemberOlderThanSixtyFive()
	{
		String personAge = String.valueOf(this.getHhMemberOlderThanSixtyFive());
		if(personAge != null && this.getHhMemberOlderThanSixtyFive() )
		{
			 return personAge = "insert{"+this.getName()+"[householdMemberOlderThan65]@basic_mod}.";
		}
		
		return "oops";
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Boolean getInterestedInMedicaid() {
		return interestedInMedicaid;
	}
	public void setInterestedInMedicaid(Boolean interestedInMedicaid) {
		this.interestedInMedicaid = interestedInMedicaid;
	}
	public Boolean getInterestedInTANF() {
		return interestedInTANF;
	}
	public void setInterestedInTANF(Boolean interestedInTANF) {
		this.interestedInTANF = interestedInTANF;
	}
	public Boolean getInterestedInSNAP() {
		return interestedInSNAP;
	}
	public void setInterestedInSNAP(Boolean interestedInSNAP) {
		this.interestedInSNAP = interestedInSNAP;
	}
	

}
