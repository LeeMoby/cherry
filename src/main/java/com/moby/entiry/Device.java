package com.moby.entiry;

import java.util.Date;

/**
 * Created by Moby on 16/6/8.
 */
public class Device {
    private Integer id;
    private String name;
    private Integer deviceTypeId;
    private String code;
    private String codeSgcc;
    private Integer roomId;
    private Integer cabinetId;
    private String cabinetPosition;
    private String manufacturer;
    private String brand;
    private String series;
    private String model;
    private String status;
    private String use;
    private Date useDate;
    private String purchaseMethod;
    private String serialNumber;
    private Date manufactureDate;
    private Date serviceExpiryDate;
    private String network;
    private String ipAddress;
    private Integer mgtDeptId;
    private Integer mgtEmployeeId;
    private String mgtPhone;
    private String maintenanceSupplier;
    private Date maintenanceDateStart;
    private Date maintenanceDateEnd;

    private DeviceType deviceType;
    private Cabinet cabinet;
    private Room room;
    private Department department;
    private Employee employee;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getDeviceTypeId() {
        return deviceTypeId;
    }

    public void setDeviceTypeId(Integer deviceTypeId) {
        this.deviceTypeId = deviceTypeId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCodeSgcc() {
        return codeSgcc;
    }

    public void setCodeSgcc(String codeSgcc) {
        this.codeSgcc = codeSgcc;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getCabinetId() {
        return cabinetId;
    }

    public void setCabinetId(Integer cabinetId) {
        this.cabinetId = cabinetId;
    }

    public String getCabinetPosition() {
        return cabinetPosition;
    }

    public void setCabinetPosition(String cabinetPosition) {
        this.cabinetPosition = cabinetPosition;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getSeries() {
        return series;
    }

    public void setSeries(String series) {
        this.series = series;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUse() {
        return use;
    }

    public void setUse(String use) {
        this.use = use;
    }

    public Date getUseDate() {
        return useDate;
    }

    public void setUseDate(Date useDate) {
        this.useDate = useDate;
    }

    public String getPurchaseMethod() {
        return purchaseMethod;
    }

    public void setPurchaseMethod(String purchaseMethod) {
        this.purchaseMethod = purchaseMethod;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public Date getManufactureDate() {
        return manufactureDate;
    }

    public void setManufactureDate(Date manufactureDate) {
        this.manufactureDate = manufactureDate;
    }

    public Date getServiceExpiryDate() {
        return serviceExpiryDate;
    }

    public void setServiceExpiryDate(Date serviceExpiryDate) {
        this.serviceExpiryDate = serviceExpiryDate;
    }

    public String getNetwork() {
        return network;
    }

    public void setNetwork(String network) {
        this.network = network;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public Integer getMgtDeptId() {
        return mgtDeptId;
    }

    public void setMgtDeptId(Integer mgtDeptId) {
        this.mgtDeptId = mgtDeptId;
    }

    public Integer getMgtEmployeeId() {
        return mgtEmployeeId;
    }

    public void setMgtEmployeeId(Integer mgtEmployeeId) {
        this.mgtEmployeeId = mgtEmployeeId;
    }

    public String getMgtPhone() {
        return mgtPhone;
    }

    public void setMgtPhone(String mgtPhone) {
        this.mgtPhone = mgtPhone;
    }

    public String getMaintenanceSupplier() {
        return maintenanceSupplier;
    }

    public void setMaintenanceSupplier(String maintenanceSupplier) {
        this.maintenanceSupplier = maintenanceSupplier;
    }

    public Date getMaintenanceDateStart() {
        return maintenanceDateStart;
    }

    public void setMaintenanceDateStart(Date maintenanceDateStart) {
        this.maintenanceDateStart = maintenanceDateStart;
    }

    public Date getMaintenanceDateEnd() {
        return maintenanceDateEnd;
    }

    public void setMaintenanceDateEnd(Date maintenanceDateEnd) {
        this.maintenanceDateEnd = maintenanceDateEnd;
    }

    public DeviceType getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(DeviceType deviceType) {
        this.deviceType = deviceType;
    }

    public Cabinet getCabinet() {
        return cabinet;
    }

    public void setCabinet(Cabinet cabinet) {
        this.cabinet = cabinet;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "Device{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", deviceTypeId=" + deviceTypeId +
                ", code='" + code + '\'' +
                ", codeSgcc='" + codeSgcc + '\'' +
                ", roomId=" + roomId +
                ", cabinetId=" + cabinetId +
                ", cabinetPosition='" + cabinetPosition + '\'' +
                ", manufacturer='" + manufacturer + '\'' +
                ", brand='" + brand + '\'' +
                ", series='" + series + '\'' +
                ", model='" + model + '\'' +
                ", status='" + status + '\'' +
                ", use='" + use + '\'' +
                ", useDate=" + useDate +
                ", purchaseMethod='" + purchaseMethod + '\'' +
                ", serialNumber='" + serialNumber + '\'' +
                ", manufactureDate=" + manufactureDate +
                ", serviceExpiryDate=" + serviceExpiryDate +
                ", network='" + network + '\'' +
                ", ipAddress='" + ipAddress + '\'' +
                ", mgtDeptId=" + mgtDeptId +
                ", mgtEmployeeId=" + mgtEmployeeId +
                ", mgtPhone='" + mgtPhone + '\'' +
                ", maintenanceSupplier='" + maintenanceSupplier + '\'' +
                ", maintenanceDateStart=" + maintenanceDateStart +
                ", maintenanceDateEnd=" + maintenanceDateEnd +
                ", deviceType=" + deviceType +
                ", cabinet=" + cabinet +
                ", room=" + room +
                ", department=" + department +
                ", employee=" + employee +
                '}';
    }
}
