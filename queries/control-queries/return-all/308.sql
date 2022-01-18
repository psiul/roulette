select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,item i,ship_mode sm,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 391 and ws.ws_hash <= 791 and i.i_hash >= 77 and i.i_hash <= 827 and c.c_hash >= 621 and c.c_hash <= 954
;
