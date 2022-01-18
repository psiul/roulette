select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,ship_mode sm,item i
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and hd.hd_hash >= 367 and hd.hd_hash <= 767 and d.d_hash >= 43 and d.d_hash <= 793 and i.i_hash >= 239 and i.i_hash <= 572
;
