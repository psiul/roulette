select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,household_demographics hd,customer c,warehouse w
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and sm.sm_hash >= 157 and sm.sm_hash <= 907 and hd.hd_hash >= 525 and hd.hd_hash <= 925 and c.c_hash >= 531 and c.c_hash <= 864
;
