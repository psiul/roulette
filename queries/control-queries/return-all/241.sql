select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,household_demographics hd,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 586 and ws.ws_hash <= 986 and d.d_hash >= 55 and d.d_hash <= 805 and hd.hd_hash >= 206 and hd.hd_hash <= 539
;
