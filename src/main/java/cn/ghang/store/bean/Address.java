package cn.ghang.store.bean;

import java.io.Serializable;

public class Address implements Serializable {

	private static final long serialVersionUID = -3606522344557634065L;

	private Integer id;
	private Integer uid;
	private String recvPerson;
	private String recvProvince;
	private String recvCity;
	private String recvArea;
	private String recvDistrict;
	private String recvAddr;
	private String recvPhone;
	private String recvTel;
	private String recvAddrCode;
	private String recvName;
	private Integer isDefault;

	public Address() {
		super();
	}

	public Address(Integer id, Integer uid, String recvPerson, String recvProvince, String recvCity, String recvArea,
			String recvDistrict, String recvAddr, String recvPhone, String recvTel, String recvAddrCode,
			String recvName, Integer isDefault) {
		super();
		this.id = id;
		this.uid = uid;
		this.recvPerson = recvPerson;
		this.recvProvince = recvProvince;
		this.recvCity = recvCity;
		this.recvArea = recvArea;
		this.recvDistrict = recvDistrict;
		this.recvAddr = recvAddr;
		this.recvPhone = recvPhone;
		this.recvTel = recvTel;
		this.recvAddrCode = recvAddrCode;
		this.recvName = recvName;
		this.isDefault = isDefault;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getRecvPerson() {
		return recvPerson;
	}

	public void setRecvPerson(String recvPerson) {
		this.recvPerson = recvPerson;
	}

	public String getRecvProvince() {
		return recvProvince;
	}

	public void setRecvProvince(String recvProvince) {
		this.recvProvince = recvProvince;
	}

	public String getRecvCity() {
		return recvCity;
	}

	public void setRecvCity(String recvCity) {
		this.recvCity = recvCity;
	}

	public String getRecvArea() {
		return recvArea;
	}

	public void setRecvArea(String recvArea) {
		this.recvArea = recvArea;
	}

	public String getRecvDistrict() {
		return recvDistrict;
	}

	public void setRecvDistrict(String recvDistrict) {
		this.recvDistrict = recvDistrict;
	}

	public String getRecvAddr() {
		return recvAddr;
	}

	public void setRecvAddr(String recvAddr) {
		this.recvAddr = recvAddr;
	}

	public String getRecvPhone() {
		return recvPhone;
	}

	public void setRecvPhone(String recvPhone) {
		this.recvPhone = recvPhone;
	}

	public String getRecvTel() {
		return recvTel;
	}

	public void setRecvTel(String recvTel) {
		this.recvTel = recvTel;
	}

	public String getRecvAddrCode() {
		return recvAddrCode;
	}

	public void setRecvAddrCode(String recvAddrCode) {
		this.recvAddrCode = recvAddrCode;
	}

	public String getRecvName() {
		return recvName;
	}

	public void setRecvName(String recvName) {
		this.recvName = recvName;
	}

	public Integer getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Integer isDefault) {
		this.isDefault = isDefault;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((isDefault == null) ? 0 : isDefault.hashCode());
		result = prime * result + ((recvAddr == null) ? 0 : recvAddr.hashCode());
		result = prime * result + ((recvAddrCode == null) ? 0 : recvAddrCode.hashCode());
		result = prime * result + ((recvArea == null) ? 0 : recvArea.hashCode());
		result = prime * result + ((recvCity == null) ? 0 : recvCity.hashCode());
		result = prime * result + ((recvDistrict == null) ? 0 : recvDistrict.hashCode());
		result = prime * result + ((recvName == null) ? 0 : recvName.hashCode());
		result = prime * result + ((recvPerson == null) ? 0 : recvPerson.hashCode());
		result = prime * result + ((recvPhone == null) ? 0 : recvPhone.hashCode());
		result = prime * result + ((recvProvince == null) ? 0 : recvProvince.hashCode());
		result = prime * result + ((recvTel == null) ? 0 : recvTel.hashCode());
		result = prime * result + ((uid == null) ? 0 : uid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Address other = (Address) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (isDefault == null) {
			if (other.isDefault != null)
				return false;
		} else if (!isDefault.equals(other.isDefault))
			return false;
		if (recvAddr == null) {
			if (other.recvAddr != null)
				return false;
		} else if (!recvAddr.equals(other.recvAddr))
			return false;
		if (recvAddrCode == null) {
			if (other.recvAddrCode != null)
				return false;
		} else if (!recvAddrCode.equals(other.recvAddrCode))
			return false;
		if (recvArea == null) {
			if (other.recvArea != null)
				return false;
		} else if (!recvArea.equals(other.recvArea))
			return false;
		if (recvCity == null) {
			if (other.recvCity != null)
				return false;
		} else if (!recvCity.equals(other.recvCity))
			return false;
		if (recvDistrict == null) {
			if (other.recvDistrict != null)
				return false;
		} else if (!recvDistrict.equals(other.recvDistrict))
			return false;
		if (recvName == null) {
			if (other.recvName != null)
				return false;
		} else if (!recvName.equals(other.recvName))
			return false;
		if (recvPerson == null) {
			if (other.recvPerson != null)
				return false;
		} else if (!recvPerson.equals(other.recvPerson))
			return false;
		if (recvPhone == null) {
			if (other.recvPhone != null)
				return false;
		} else if (!recvPhone.equals(other.recvPhone))
			return false;
		if (recvProvince == null) {
			if (other.recvProvince != null)
				return false;
		} else if (!recvProvince.equals(other.recvProvince))
			return false;
		if (recvTel == null) {
			if (other.recvTel != null)
				return false;
		} else if (!recvTel.equals(other.recvTel))
			return false;
		if (uid == null) {
			if (other.uid != null)
				return false;
		} else if (!uid.equals(other.uid))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", uid=" + uid + ", recvPerson=" + recvPerson + ", recvProvince=" + recvProvince
				+ ", recvCity=" + recvCity + ", recvArea=" + recvArea + ", recvDistrict=" + recvDistrict + ", recvAddr="
				+ recvAddr + ", recvPhone=" + recvPhone + ", recvTel=" + recvTel + ", recvAddrCode=" + recvAddrCode
				+ ", recvName=" + recvName + ", isDefault=" + isDefault + "]";
	}

}
