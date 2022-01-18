select count(ws.ws_item_sk)
from web_sales ws,warehouse w,household_demographics hd,ship_mode sm,customer c
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 169 and ws.ws_hash <= 569 and sm.sm_hash >= 75 and sm.sm_hash <= 825 and c.c_hash >= 624 and c.c_hash <= 957
;
