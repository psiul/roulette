select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,web_returns wr,customer c
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_refunded_customer_sk = c.c_customer_sk and ws.ws_hash >= 141 and ws.ws_hash <= 891 and d.d_hash >= 153 and d.d_hash <= 553 and c.c_hash >= 270 and c.c_hash <= 603
;
