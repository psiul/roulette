select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,ship_mode sm,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 55 and ws.ws_hash <= 388 and d.d_hash >= 65 and d.d_hash <= 815 and i.i_hash >= 469 and i.i_hash <= 869
;
