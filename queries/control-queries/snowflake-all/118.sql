select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,warehouse w,customer c,ship_mode sm
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 147 and ws.ws_hash <= 480 and hd.hd_hash >= 134 and hd.hd_hash <= 884 and c.c_hash >= 314 and c.c_hash <= 714
;
