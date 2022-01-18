select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,item i,ship_mode sm
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 73 and ws.ws_hash <= 473 and i.i_hash >= 27 and i.i_hash <= 777 and sm.sm_hash >= 312 and sm.sm_hash <= 645
;
