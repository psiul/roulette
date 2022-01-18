select count(ws.ws_item_sk)
from web_sales ws,customer c,web_returns wr,household_demographics hd,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and c.c_hash >= 224 and c.c_hash <= 974 and hd.hd_hash >= 297 and hd.hd_hash <= 630 and d.d_hash >= 83 and d.d_hash <= 483
;
