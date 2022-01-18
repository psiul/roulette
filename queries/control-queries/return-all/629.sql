select count(ws.ws_item_sk)
from web_sales ws,customer c,ship_mode sm,household_demographics hd,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 14 and ws.ws_hash <= 347 and hd.hd_hash >= 492 and hd.hd_hash <= 892 and i.i_hash >= 248 and i.i_hash <= 998
;
