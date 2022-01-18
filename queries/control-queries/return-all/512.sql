select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,household_demographics hd,warehouse w
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 417 and ws.ws_hash <= 750 and sm.sm_hash >= 223 and sm.sm_hash <= 973 and c.c_hash >= 191 and c.c_hash <= 591
;
