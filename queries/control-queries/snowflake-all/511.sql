select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,household_demographics hd,ship_mode sm
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_hash >= 242 and c.c_hash <= 992 and hd.hd_hash >= 10 and hd.hd_hash <= 410 and sm.sm_hash >= 601 and sm.sm_hash <= 934
;
