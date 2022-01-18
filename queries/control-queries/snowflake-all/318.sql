select count(ws.ws_item_sk)
from web_sales ws,item i,ship_mode sm,date_dim d,household_demographics hd
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 103 and ws.ws_hash <= 853 and sm.sm_hash >= 471 and sm.sm_hash <= 871 and hd.hd_hash >= 539 and hd.hd_hash <= 872
;
