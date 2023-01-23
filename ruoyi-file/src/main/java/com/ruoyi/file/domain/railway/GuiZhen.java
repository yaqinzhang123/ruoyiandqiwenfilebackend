package com.ruoyi.file.domain.railway;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Table(name = "tb_GuiZhen")
@Entity
@TableName("tb_GuiZhen")
public class GuiZhen {
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
    private String GuiZhenType;
    private String GuiZhenXingHao;
    private String ShengChanChangJiaCode;
    private String ZhiZaoNianDu;
    private Date PuSheDate;
    private String KouJianType;
    private String KouJianXingHao;
    private Date KouJianGengHuanDate;
    private String PuSheChangDu;
    private String PuSheGenShu;
    private String Remark;

}


