package com.ruoyi.file.domain.railway;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Table(name = "tb_GangGui")
@Entity
@TableName("tb_GangGui")
public class GangGui {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    public Integer ID;
    private String MainCode;
    private String XianLuCode;
    private String CheZhanCode;
    private String XingBie;
    private String XianBie;
    private String GuDaoNum;
    private String StartKM;
    private String StartLongitude;
    private String StartLatitude;
    private String EndKM;
    private String EndLongitude;
    private String EndLatitude;
    private String GuiJuType;
    private String YunYingStatus;
    private String ChangLianFlag;
    private String ZuoYouGu;
    private String GongLiBiao;
    private String GuiHao;
    private String GangGuiNum;
    private String GuiChang;
    private String GuiXing;
    private String GangZhong;
    private String ShengChanChangJiaCode;
    private String ZhiZaoNianDu;
    private String RongLuHao;
    private String IsZaiYongGui;
    private String TongGuoSum;
    private String JieTouFangShi;
    private String HuanGuiNianYue;
    private Date PuSheDate;
    private Date XiaDaoDate;
    private String UseStatus;
    private String GangGuiTeZheng;
    private String Remark;

}


