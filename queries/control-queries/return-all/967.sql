select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,ship_mode sm,item i
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 153 and ws.ws_hash <= 553 and d.d_hash >= 354 and d.d_hash <= 687 and sm.sm_hash >= 236 and sm.sm_hash <= 986
;
