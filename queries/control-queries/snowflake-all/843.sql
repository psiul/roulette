select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,item i,date_dim d,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and sm.sm_hash >= 67 and sm.sm_hash <= 400 and i.i_hash >= 22 and i.i_hash <= 772 and d.d_hash >= 376 and d.d_hash <= 776
;
