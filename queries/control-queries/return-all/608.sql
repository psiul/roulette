select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,household_demographics hd,ship_mode sm
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 236 and ws.ws_hash <= 986 and hd.hd_hash >= 288 and hd.hd_hash <= 621 and sm.sm_hash >= 394 and sm.sm_hash <= 794
;
