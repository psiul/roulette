select count(ws.ws_item_sk)
from web_sales ws,customer c,ship_mode sm,warehouse w,web_returns wr
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 198 and ws.ws_hash <= 948 and c.c_hash >= 353 and c.c_hash <= 753 and sm.sm_hash >= 265 and sm.sm_hash <= 598
;
