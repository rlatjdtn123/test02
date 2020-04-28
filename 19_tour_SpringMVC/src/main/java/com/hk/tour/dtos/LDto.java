package com.hk.tour.dtos;

public class LDto {
	
	private int tseq;
	private String infoname;
	private String pnumber;
	private String lcategory;
	private String mcategory;
	private String rcategory;
	private String location;
	private String citycounties;
	private String dong;
	private String address;
	private int grade;
	
	private RDto rdto;
	private double gradeavg;
	private int numc;
	
	public LDto() {
		super();
	}


	public LDto(int tseq, String infoname, String pnumber, String lcategory, String mcategory, String rcategory,
			String location, String citycounties, String dong, String address, int grade,RDto rdto,int gradeavg,int numc) {
		super();
		this.tseq = tseq;
		this.infoname = infoname;
		this.pnumber = pnumber;
		this.lcategory = lcategory;
		this.mcategory = mcategory;
		this.rcategory = rcategory;
		this.location = location;
		this.citycounties = citycounties;
		this.dong = dong;
		this.address = address;
		this.grade = grade;
		this.rdto = rdto;
		this.gradeavg = gradeavg;
		this.numc = numc;
	}

	
	
	
	

	public int getNumc() {
		return numc;
	}


	public void setNumc(int numc) {
		this.numc = numc;
	}


	public int getTseq() {
		return tseq;
	}


	public void setTseq(int tseq) {
		this.tseq = tseq;
	}


	public String getInfoname() {
		return infoname;
	}


	public void setInfoname(String infoname) {
		this.infoname = infoname;
	}


	public String getPnumber() {
		return pnumber;
	}


	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}


	public String getLcategory() {
		return lcategory;
	}


	public void setLcategory(String lcategory) {
		this.lcategory = lcategory;
	}


	public String getMcategory() {
		return mcategory;
	}


	public void setMcategory(String mcategory) {
		this.mcategory = mcategory;
	}


	public String getRcategory() {
		return rcategory;
	}


	public void setRcategory(String rcategory) {
		this.rcategory = rcategory;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getCitycounties() {
		return citycounties;
	}


	public void setCitycounties(String citycounties) {
		this.citycounties = citycounties;
	}


	public String getDong() {
		return dong;
	}


	public void setDong(String dong) {
		this.dong = dong;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}

	
	

	public RDto getRdto() {
		return rdto;
	}


	public void setRdto(RDto rdto) {
		this.rdto = rdto;
	}

	
	

	public double getGradeavg() {
		return gradeavg;
	}


	public void setGradeavg(double gradeavg) {
		this.gradeavg = gradeavg;
	}


	@Override
	public String toString() {
		return "LDto [tseq=" + tseq + ", infoname=" + infoname + ", pnumber=" + pnumber + ", lcategory=" + lcategory
				+ ", mcategory=" + mcategory + ", rcategory=" + rcategory + ", location=" + location + ", citycounties="
				+ citycounties + ", dong=" + dong + ", address=" + address + ", grade=" + grade + ", rdto=" + rdto
				+ ", gradeavg=" + gradeavg + ", numc=" + numc + "]";
	}


	


	


	
	
	
	
	
	
	
}
