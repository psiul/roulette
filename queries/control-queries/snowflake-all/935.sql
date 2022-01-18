select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,item i,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 277 and ws.ws_hash <= 677 and sm.sm_hash >= 297 and sm.sm_hash <= 630 and hd.hd_hash >= 46 and hd.hd_hash <= 796
;
