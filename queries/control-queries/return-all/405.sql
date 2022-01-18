select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,household_demographics hd,customer c
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and wr.wr_refunded_customer_sk = c.c_customer_sk and ws.ws_hash >= 325 and ws.ws_hash <= 725 and d.d_hash >= 41 and d.d_hash <= 791 and hd.hd_hash >= 81 and hd.hd_hash <= 414
;
