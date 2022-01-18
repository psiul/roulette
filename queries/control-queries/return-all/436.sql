select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,item i,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 257 and ws.ws_hash <= 590 and d.d_hash >= 44 and d.d_hash <= 444 and i.i_hash >= 193 and i.i_hash <= 943
;
