select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,warehouse w,ship_mode sm,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 43 and ws.ws_hash <= 793 and hd.hd_hash >= 476 and hd.hd_hash <= 809 and sm.sm_hash >= 246 and sm.sm_hash <= 646
;
