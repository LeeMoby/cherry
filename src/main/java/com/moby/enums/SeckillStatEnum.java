package com.moby.enums;

/**
 * 使用枚举表示常量数据字典
 * Created by Moby on 16/6/8.
 */
public enum SeckillStatEnum {
    SUCCESS(1, "秒杀成功"),
    END(0, "秒杀结束"),
    REPEAT_KILL(-1, "重复秒杀"),
    INNER_ERROT(-2, "系统异常"),
    DATA_REWRITE(-3, "数据篡改");

    private int state;
    private String stateInfo;

    SeckillStatEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public  static SeckillStatEnum statOf(int index){
        for (SeckillStatEnum state : values()){
            if(state.getState() == index){
                return state;
            }
        }
        return null;

    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }
}
