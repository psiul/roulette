select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,date_dim d,reason r,customer c
where ws.ws_order_number = wr.wr_order_number and ws.ws_sold_date_sk = d.d_date_sk and wr.wr_reason_sk = r.r_reason_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 399 and ws.ws_hash <= 799 and d.d_hash >= 272 and d.d_hash <= 605 and c.c_hash >= 71 and c.c_hash <= 821
;
