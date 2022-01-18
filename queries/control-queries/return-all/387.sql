select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,web_returns wr,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_returned_date_sk = d.d_date_sk and c.c_hash >= 61 and c.c_hash <= 461 and cd.cd_hash >= 316 and cd.cd_hash <= 649 and d.d_hash >= 235 and d.d_hash <= 985
;
