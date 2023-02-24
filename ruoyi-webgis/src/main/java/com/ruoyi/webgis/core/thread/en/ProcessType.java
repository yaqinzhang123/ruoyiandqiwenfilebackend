package com.ruoyi.webgis.core.thread.en;

public enum ProcessType {

    Services("Services"),
    Console("Console");

    String desp;

    ProcessType(String desp) {
        this.desp = desp;
    }

    public String getDesp() {
        return desp;
    }
}
