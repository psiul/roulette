select count(ws.ws_item_sk)
from web_sales ws,item i,ship_mode sm,customer c,household_demographics hd
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 188 and ws.ws_hash <= 588 and sm.sm_hash >= 15 and sm.sm_hash <= 348 and c.c_hash >= 191 and c.c_hash <= 941
;
