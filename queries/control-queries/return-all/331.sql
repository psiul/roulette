select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,customer_demographics cd,web_returns wr
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and d.d_hash >= 65 and d.d_hash <= 815 and c.c_hash >= 557 and c.c_hash <= 890 and cd.cd_hash >= 350 and cd.cd_hash <= 750
;
