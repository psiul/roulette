select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,household_demographics hd,web_returns wr
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_order_number = wr.wr_order_number and d.d_hash >= 174 and d.d_hash <= 574 and c.c_hash >= 633 and c.c_hash <= 966 and hd.hd_hash >= 51 and hd.hd_hash <= 801
;
