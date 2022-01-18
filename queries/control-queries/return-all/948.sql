select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,item i,ship_mode sm
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 529 and ws.ws_hash <= 862 and d.d_hash >= 196 and d.d_hash <= 946 and i.i_hash >= 69 and i.i_hash <= 469
;
