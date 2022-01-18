select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,item i,warehouse w,ship_mode sm
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and hd.hd_hash >= 93 and hd.hd_hash <= 843 and i.i_hash >= 495 and i.i_hash <= 895 and sm.sm_hash >= 443 and sm.sm_hash <= 776
;
