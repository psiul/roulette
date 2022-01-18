select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,item i,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 167 and ws.ws_hash <= 917 and i.i_hash >= 501 and i.i_hash <= 834 and hd.hd_hash >= 264 and hd.hd_hash <= 664
;
