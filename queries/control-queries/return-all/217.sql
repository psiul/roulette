select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,customer c,date_dim d,web_returns wr
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 119 and ws.ws_hash <= 452 and cd.cd_hash >= 139 and cd.cd_hash <= 889 and d.d_hash >= 60 and d.d_hash <= 460
;
