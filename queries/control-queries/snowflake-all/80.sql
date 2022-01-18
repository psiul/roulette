select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,item i,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 35 and ws.ws_hash <= 785 and sm.sm_hash >= 277 and sm.sm_hash <= 677 and i.i_hash >= 471 and i.i_hash <= 804
;
