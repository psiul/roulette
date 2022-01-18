select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,web_returns wr,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 230 and ws.ws_hash <= 980 and d.d_hash >= 480 and d.d_hash <= 813 and sm.sm_hash >= 419 and sm.sm_hash <= 819
;
