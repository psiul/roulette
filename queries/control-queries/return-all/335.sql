select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,item i,customer c,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 59 and i.i_hash <= 392 and c.c_hash >= 11 and c.c_hash <= 411 and hd.hd_hash >= 31 and hd.hd_hash <= 781
;
