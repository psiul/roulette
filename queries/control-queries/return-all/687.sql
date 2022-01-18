select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,web_returns wr,customer c
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_refunded_customer_sk = c.c_customer_sk and ws.ws_hash >= 40 and ws.ws_hash <= 440 and cd.cd_hash >= 34 and cd.cd_hash <= 784 and c.c_hash >= 271 and c.c_hash <= 604
;
