select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,item i,ship_mode sm
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 27 and ws.ws_hash <= 427 and d.d_hash >= 135 and d.d_hash <= 885 and sm.sm_hash >= 31 and sm.sm_hash <= 364
;
