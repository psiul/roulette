select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,ship_mode sm,date_dim d,web_returns wr
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 411 and ws.ws_hash <= 811 and sm.sm_hash >= 19 and sm.sm_hash <= 769 and d.d_hash >= 17 and d.d_hash <= 350
;
