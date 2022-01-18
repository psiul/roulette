select count(ws.ws_item_sk)
from web_sales ws,warehouse w,item i,household_demographics hd,ship_mode sm
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 100 and ws.ws_hash <= 500 and i.i_hash >= 116 and i.i_hash <= 866 and hd.hd_hash >= 660 and hd.hd_hash <= 993
;
