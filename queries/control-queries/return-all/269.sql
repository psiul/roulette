select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,web_returns wr,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 444 and ws.ws_hash <= 844 and sm.sm_hash >= 85 and sm.sm_hash <= 835 and d.d_hash >= 241 and d.d_hash <= 574
;
