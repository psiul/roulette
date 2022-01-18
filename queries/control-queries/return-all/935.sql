select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,warehouse w,web_returns wr,reason r
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_reason_sk = r.r_reason_sk and ws.ws_hash >= 201 and ws.ws_hash <= 601 and sm.sm_hash >= 78 and sm.sm_hash <= 828
;
