select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,reason r,customer c,date_dim d
where ws.ws_order_number = wr.wr_order_number and wr.wr_reason_sk = r.r_reason_sk and wr.wr_refunded_customer_sk = c.c_customer_sk and wr.wr_returned_date_sk = d.d_date_sk and ws.ws_hash >= 67 and ws.ws_hash <= 817 and c.c_hash >= 21 and c.c_hash <= 421 and d.d_hash >= 460 and d.d_hash <= 793
;
