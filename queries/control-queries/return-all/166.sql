select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,date_dim d,web_returns wr
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and c.c_hash >= 65 and c.c_hash <= 465 and hd.hd_hash >= 104 and hd.hd_hash <= 854 and d.d_hash >= 220 and d.d_hash <= 553
;
