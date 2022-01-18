select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,web_returns wr,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 14 and ws.ws_hash <= 347 and sm.sm_hash >= 178 and sm.sm_hash <= 928 and hd.hd_hash >= 424 and hd.hd_hash <= 824
;
