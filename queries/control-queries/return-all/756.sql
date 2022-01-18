select count(ws.ws_item_sk)
from web_sales ws,customer c,ship_mode sm,household_demographics hd,warehouse w
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 592 and ws.ws_hash <= 992 and c.c_hash >= 213 and c.c_hash <= 546 and sm.sm_hash >= 79 and sm.sm_hash <= 829
;
