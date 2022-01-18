select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,customer c,web_returns wr
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and d.d_hash >= 512 and d.d_hash <= 845 and cd.cd_hash >= 296 and cd.cd_hash <= 696 and c.c_hash >= 1 and c.c_hash <= 751
;
