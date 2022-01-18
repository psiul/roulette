select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,date_dim d,customer c,household_demographics hd
where ws.ws_order_number = wr.wr_order_number and ws.ws_ship_date_sk = d.d_date_sk and wr.wr_refunded_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 240 and d.d_hash <= 573 and c.c_hash >= 139 and c.c_hash <= 889 and hd.hd_hash >= 554 and hd.hd_hash <= 954
;
