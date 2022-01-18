select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,ship_mode sm,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 149 and ws.ws_hash <= 899 and hd.hd_hash >= 168 and hd.hd_hash <= 568 and i.i_hash >= 395 and i.i_hash <= 728
;
