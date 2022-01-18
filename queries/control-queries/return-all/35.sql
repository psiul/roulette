select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,web_returns wr,warehouse w,customer c
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 101 and ws.ws_hash <= 851 and cd.cd_hash >= 581 and cd.cd_hash <= 914 and c.c_hash >= 180 and c.c_hash <= 580
;
