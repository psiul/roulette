select count(ws.ws_item_sk)
from web_sales ws,item i,customer c,household_demographics hd,ship_mode sm
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 499 and ws.ws_hash <= 899 and i.i_hash >= 0 and i.i_hash <= 333 and sm.sm_hash >= 180 and sm.sm_hash <= 930
;
